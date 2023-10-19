/*******************************************************************************
 * Copyright (c) 2021,2023 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Apache License, Version 2.0 which is available at
 * https://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 ******************************************************************************/

package org.eclipse.tractusx.bpdm.gate.controller

import org.assertj.core.api.Assertions.assertThat
import org.eclipse.tractusx.bpdm.common.dto.BusinessPartnerType
import org.eclipse.tractusx.bpdm.common.dto.request.PaginationRequest
import org.eclipse.tractusx.bpdm.gate.api.client.GateClient
import org.eclipse.tractusx.bpdm.gate.api.exception.BusinessPartnerSharingError
import org.eclipse.tractusx.bpdm.gate.api.exception.BusinessPartnerSharingError.*
import org.eclipse.tractusx.bpdm.gate.api.model.SharingStateType
import org.eclipse.tractusx.bpdm.gate.api.model.response.SharingStateDto
import org.eclipse.tractusx.bpdm.gate.util.DbTestHelpers
import org.eclipse.tractusx.bpdm.gate.util.PostgreSQLContextInitializer
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest
import org.springframework.test.context.ActiveProfiles
import org.springframework.test.context.ContextConfiguration
import java.time.LocalDateTime

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@ActiveProfiles("test")
@ContextConfiguration(initializers = [PostgreSQLContextInitializer::class])
class SharingStateControllerIT @Autowired constructor(

    private val testHelpers: DbTestHelpers,
    val gateClient: GateClient,
) {

    @BeforeEach
    fun beforeEach() {
        testHelpers.truncateDbTables()
    }

    @Test
    fun `insert and get sharing states `() {

        val stateAddress = insertSharingStateSuccess(BusinessPartnerType.ADDRESS, externalId = "exIdAddress")
        val stateSite = insertSharingStateSuccess(BusinessPartnerType.SITE, externalId = "exIdSite")
        val stateLegalEntity1 = insertSharingStateSuccess(BusinessPartnerType.LEGAL_ENTITY, externalId = "exIdEntity1")
        val stateLegalEntity2 = insertSharingStateSuccess(BusinessPartnerType.LEGAL_ENTITY, externalId = "exIdEntity2")
        val stateGeneric = insertSharingStateSuccess(BusinessPartnerType.GENERIC, externalId = "exIdGeneric1")
        insertSharingStateSuccess(BusinessPartnerType.ADDRESS, externalId = "exIdMultiple")
        insertSharingStateSuccess(BusinessPartnerType.SITE, externalId = "exIdMultiple")
        insertSharingStateSuccess(BusinessPartnerType.LEGAL_ENTITY, externalId = "exIdMultiple")
        insertSharingStateSuccess(BusinessPartnerType.GENERIC, externalId = "exIdMultiple")

        val searchAddressById = readSharingStates(BusinessPartnerType.ADDRESS, "exIdAddress")
        assertThat(searchAddressById).hasSize(1)
        assertThat(searchAddressById.first()).isEqualTo(stateAddress)

        val searchSitesById = readSharingStates(BusinessPartnerType.SITE, "exIdSite")
        assertThat(searchSitesById).hasSize(1)
        assertThat(searchSitesById.first()).isEqualTo(stateSite)

        val searchAddressWrongId = readSharingStates(BusinessPartnerType.ADDRESS, "exIdEntity")
        assertThat(searchAddressWrongId).hasSize(0)

        val searchEntityMultiple = readSharingStates(BusinessPartnerType.LEGAL_ENTITY, "exIdEntity1", "exIdEntity2")
        assertThat(searchEntityMultiple).hasSize(2)

        val searchEntitySingle = readSharingStates(BusinessPartnerType.LEGAL_ENTITY, "exIdEntity2")
        assertThat(searchEntitySingle).hasSize(1)
        assertThat(searchEntitySingle.first()).isEqualTo(stateLegalEntity2)

        val searchGenericSingle = readSharingStates(BusinessPartnerType.GENERIC, "exIdGeneric1")
        assertThat(searchGenericSingle).hasSize(1)
        assertThat(searchGenericSingle.first()).isEqualTo(stateGeneric)

        val searchAll = readSharingStates(null)
        assertThat(searchAll).hasSize(9)

        val searchEntityAllLegalEntities = readSharingStates(BusinessPartnerType.LEGAL_ENTITY)
        assertThat(searchEntityAllLegalEntities).hasSize(3)
        assertThat(searchEntityAllLegalEntities).extracting(SharingStateDto::externalId.name)
            .contains(stateLegalEntity1.externalId, stateLegalEntity2.externalId, "exIdMultiple")

        val searchAllWithSameId = readSharingStates(null, "exIdMultiple")
        assertThat(searchAllWithSameId).hasSize(4)
        assertThat(searchAllWithSameId).extracting(SharingStateDto::externalId.name)
            .containsOnly("exIdMultiple")

    }

    @Test
    fun `insert and get sharing states with error code`() {

        val stateAddress1 = insertSharingStateError(BusinessPartnerType.ADDRESS, externalId = "exIdAddress1", errorCode = SharingTimeout)
        insertSharingStateError(BusinessPartnerType.ADDRESS, externalId = "exIdAddress2", errorCode = SharingProcessError)
        insertSharingStateError(BusinessPartnerType.ADDRESS, externalId = "exIdAddress3", errorCode = BpnNotInPool)

        val searchAddress = readSharingStates(BusinessPartnerType.ADDRESS, "exIdAddress1")
        assertThat(searchAddress).hasSize(1)
        assertThat(searchAddress.first()).isEqualTo(stateAddress1)
    }


    @Test
    fun `insert and update states`() {

        val stateAddress1 = insertSharingStateError(BusinessPartnerType.ADDRESS, externalId = "exIdAddress1", errorCode = SharingTimeout)
        insertSharingStateError(BusinessPartnerType.ADDRESS, externalId = "exIdAddress2", errorCode = SharingProcessError)
        insertSharingStateError(BusinessPartnerType.ADDRESS, externalId = "exIdAddress3", errorCode = BpnNotInPool)

        val searchAddress = readSharingStates(BusinessPartnerType.ADDRESS, "exIdAddress1")
        assertThat(searchAddress).hasSize(1)
        assertThat(searchAddress.first()).isEqualTo(stateAddress1)

        val updatedAddress1 = stateAddress1.copy(
            sharingStateType = SharingStateType.Success,
            sharingErrorCode = BpnNotInPool,
            sharingProcessStarted = LocalDateTime.now().withNano(0),
            sharingErrorMessage = "Changed ",
            bpn = null
        )

        gateClient.sharingState.upsertSharingState(updatedAddress1)

        val readUpdatedAddress = readSharingStates(BusinessPartnerType.ADDRESS, "exIdAddress1")
        assertThat(readUpdatedAddress).hasSize(1)
        assertThat(readUpdatedAddress.first()).isEqualTo(updatedAddress1)
    }

    @Test
    fun `insert and update states with sharingProcessStarted`() {

        val startTime = LocalDateTime.now().withNano(0)
        val stateAddress1 = insertSharingStateSuccess(
            businessPartnerType = BusinessPartnerType.ADDRESS, externalId = "exIdAddress1",
            sharingProcessStarted = startTime
        )

        val readInsertedAddress = readSharingStates(BusinessPartnerType.ADDRESS, "exIdAddress1")
        assertThat(readInsertedAddress.first().sharingProcessStarted).isEqualTo(startTime)

        val updatedWithEmpyStarted = stateAddress1.copy(
            sharingStateType = SharingStateType.Error,
            sharingProcessStarted = null,
            sharingErrorMessage = "Changed",
        )
        gateClient.sharingState.upsertSharingState(updatedWithEmpyStarted)

        val readUpdatedAddress = readSharingStates(BusinessPartnerType.ADDRESS, "exIdAddress1")
        assertThat(readUpdatedAddress.first().sharingStateType).isEqualTo(SharingStateType.Error)
        assertThat(readUpdatedAddress.first().sharingProcessStarted).isEqualTo(startTime).describedAs("Update with null - sharingProcessStarted not changed ")
        assertThat(readUpdatedAddress.first().sharingErrorMessage).isEqualTo("Changed")

    }

    /**
     * Insert Sharing State only with required fields filled
     */
    fun insertSharingStateSuccess(businessPartnerType: BusinessPartnerType, externalId: String, sharingProcessStarted: LocalDateTime? = null): SharingStateDto {

        val newState = SharingStateDto(
            businessPartnerType = businessPartnerType,
            externalId = externalId,
            sharingStateType = SharingStateType.Success,
            sharingErrorCode = null,
            sharingProcessStarted = sharingProcessStarted,
            sharingErrorMessage = null,
            bpn = null
        )
        gateClient.sharingState.upsertSharingState(newState)
        return newState
    }

    /**
     * Insert Sharing State with all Fields Field
     */
    fun insertSharingStateError(businessPartnerType: BusinessPartnerType, externalId: String, errorCode: BusinessPartnerSharingError): SharingStateDto {

        val newState = SharingStateDto(
            businessPartnerType = businessPartnerType,
            externalId = externalId,
            sharingStateType = SharingStateType.Error,
            sharingErrorCode = errorCode,
            sharingProcessStarted = LocalDateTime.now().withNano(0),
            sharingErrorMessage = "Error in $businessPartnerType with external id $externalId",
            bpn = "BPN" + externalId
        )
        gateClient.sharingState.upsertSharingState(newState)
        return newState
    }

    fun readSharingStates(businessPartnerType: BusinessPartnerType?, vararg externalIds: String): Collection<SharingStateDto> {

        return gateClient.sharingState.getSharingStates(PaginationRequest(), businessPartnerType, externalIds.asList()).content
    }


}