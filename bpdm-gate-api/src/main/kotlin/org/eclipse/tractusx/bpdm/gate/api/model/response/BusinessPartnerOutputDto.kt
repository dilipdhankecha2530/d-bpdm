/*******************************************************************************
 * Copyright (c) 2021,2024 Contributors to the Eclipse Foundation
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

package org.eclipse.tractusx.bpdm.gate.api.model.response

import io.swagger.v3.oas.annotations.media.Schema
import org.eclipse.tractusx.bpdm.common.dto.*
import org.eclipse.tractusx.bpdm.common.dto.openapidescription.CommonDescription
import org.eclipse.tractusx.bpdm.gate.api.model.*
import java.time.Instant

@Schema(
    description = "Generic business partner output with external id",
    requiredProperties = ["externalId"]
)
data class BusinessPartnerOutputDto(

    override val externalId: String,
    override val nameParts: List<String> = emptyList(),
    override val identifiers: Collection<BusinessPartnerIdentifierDto> = emptyList(),
    override val states: Collection<BusinessPartnerStateDto> = emptyList(),
    override val roles: Collection<BusinessPartnerRole> = emptyList(),
    override val isOwnCompanyData: Boolean = false,
    override val legalEntity: LegalEntityRepresentationOutputDto,
    override val site: SiteRepresentationOutputDto?,
    override val address: AddressComponentOutputDto,
    override val externalSequenceTimestamp: Instant? = null,

    @get:Schema(description = CommonDescription.createdAt)
    val createdAt: Instant,

    @get:Schema(description = CommonDescription.updatedAt)
    val updatedAt: Instant

) : IBaseBusinessPartnerGateDto

@Schema(
    description = "Legal Entity properties of business partner output data",
    requiredProperties = ["bpnL"]
)
data class LegalEntityRepresentationOutputDto(
    override val legalEntityBpn: String,
    override val legalName: String? = null,
    override val shortName: String? = null,
    override val legalForm: String? = null,
    val confidenceCriteria: ConfidenceCriteriaDto,
    override val states: Collection<BusinessPartnerStateDto> = emptyList()
) : IBaseLegalEntityRepresentation

@Schema(
    description = "Site properties of business partner output data"
)
data class SiteRepresentationOutputDto(
    override val siteBpn: String,
    override val name: String? = null,
    val confidenceCriteria: ConfidenceCriteriaDto,
    override val states: Collection<BusinessPartnerStateDto> = emptyList()
) : IBaseSiteRepresentation

@Schema(
    description = "Address properties of business partner output data",
    requiredProperties = ["bpnA"]
)
data class AddressComponentOutputDto(
    override val addressBpn: String,
    override val name: String? = null,
    override val addressType: AddressType?,
    override val physicalPostalAddress: PhysicalPostalAddressDto = PhysicalPostalAddressDto(),
    override val alternativePostalAddress: AlternativePostalAddressDto? = null,
    val confidenceCriteria: ConfidenceCriteriaDto,
    override val states: Collection<BusinessPartnerStateDto> = emptyList()
) : IBaseAddressRepresentation
