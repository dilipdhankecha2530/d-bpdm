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

package org.eclipse.tractusx.bpdm.pool.util

import org.eclipse.tractusx.bpdm.common.dto.*
import org.eclipse.tractusx.bpdm.common.dto.response.type.TypeKeyNameDto
import org.eclipse.tractusx.bpdm.pool.api.model.request.*

object RequestValues {

    val name1 = NameDto(value = CommonValues.name1, shortName = null)
    val name2 = NameDto(value = CommonValues.name2, shortName = null)
    val name3 = NameDto(value = CommonValues.name3, shortName = null)
    val name4 = NameDto(value = CommonValues.name4, shortName = null)
    val name5 = NameDto(value = CommonValues.name5, shortName = null)

    val identifierType1 = TypeKeyNameDto(CommonValues.identifierTypeTechnicalKey1, CommonValues.identifierTypeName1)
    val identifierType2 = TypeKeyNameDto(CommonValues.identifierTypeTechnicalKey2, CommonValues.identifierTypeName2)
    val identifierType3 = TypeKeyNameDto(CommonValues.identifierTypeTechnicalKey3, CommonValues.identifierTypeName3)

    val identifierTypeDto1 = IdentifierTypeDto(CommonValues.identifierTypeTechnicalKey1, IdentifierLsaType.LEGAL_ENTITY, CommonValues.identifierTypeName1)
    val identifierTypeDto2 = IdentifierTypeDto(CommonValues.identifierTypeTechnicalKey2, IdentifierLsaType.LEGAL_ENTITY, CommonValues.identifierTypeName2)
    val identifierTypeDto3 = IdentifierTypeDto(CommonValues.identifierTypeTechnicalKey3, IdentifierLsaType.LEGAL_ENTITY, CommonValues.identifierTypeName3)

    val identifier1 = LegalEntityIdentifierDto(
        value = CommonValues.identifierValue1,
        type = CommonValues.identifierTypeTechnicalKey1,
        issuingBody = CommonValues.issuingBody1,
    )

    val identifier2 = LegalEntityIdentifierDto(
        value = CommonValues.identifierValue2,
        type = CommonValues.identifierTypeTechnicalKey2,
        issuingBody = CommonValues.issuingBody2,
    )

    val identifier3 = LegalEntityIdentifierDto(
        value = CommonValues.identifierValue3,
        type = CommonValues.identifierTypeTechnicalKey3,
        issuingBody = CommonValues.issuingBody3,
    )

    val legalForm1 = LegalFormRequest(
        technicalKey = CommonValues.legalFormTechnicalKey1,
        name = CommonValues.legalFormName1,
        abbreviation = CommonValues.legalFormAbbreviation1,
    )
    val legalForm2 = LegalFormRequest(
        technicalKey = CommonValues.legalFormTechnicalKey2,
        name = CommonValues.legalFormName2,
        abbreviation = CommonValues.legalFormAbbreviation2,
    )
    val legalForm3 = LegalFormRequest(
        technicalKey = CommonValues.legalFormTechnicalKey3,
        name = CommonValues.legalFormName3,
        abbreviation = CommonValues.legalFormAbbreviation3,
    )

    val leStatus1 = LegalEntityStateDto(CommonValues.statusDenotation1, CommonValues.statusValidFrom1, null, CommonValues.statusType1)
    val leStatus2 = LegalEntityStateDto(CommonValues.statusDenotation2, CommonValues.statusValidFrom2, null, CommonValues.statusType2)
    val leStatus3 = LegalEntityStateDto(CommonValues.statusDenotation3, CommonValues.statusValidFrom3, null, CommonValues.statusType3)

    val siteStatus1 = SiteStateDto(CommonValues.statusDenotation1, CommonValues.statusValidFrom1, null, CommonValues.statusType1)
    val siteStatus2 = SiteStateDto(CommonValues.statusDenotation2, CommonValues.statusValidFrom2, null, CommonValues.statusType2)
    val siteStatus3 = SiteStateDto(CommonValues.statusDenotation3, CommonValues.statusValidFrom3, null, CommonValues.statusType3)

    val classification1 = ClassificationDto(CommonValues.classification1, null, CommonValues.classificationType)
    val classification2 = ClassificationDto(CommonValues.classification2, null, CommonValues.classificationType)
    val classification3 = ClassificationDto(CommonValues.classification3, null, CommonValues.classificationType)
    val classification4 = ClassificationDto(CommonValues.classification4, null, CommonValues.classificationType)
    val classification5 = ClassificationDto(CommonValues.classification5, null, CommonValues.classificationType)


    val version1 = AddressVersionDto(CommonValues.characterSet1, CommonValues.language0)

    val postalAddress1 = PhysicalPostalAddressDto(
        companyPostCode = CommonValues.postCode2,
        industrialZone = CommonValues.industrialZone1,
        building = CommonValues.building1,
        floor = CommonValues.floor1,
        door = CommonValues.door1,
        areaPart = AreaDistrictDto(
            administrativeAreaLevel1 = CommonValues.adminAreaLevel1RegionCode_1,
            administrativeAreaLevel2 = CommonValues.county1,
            district = CommonValues.district1,
        ),
        baseAddress = BasePostalAddressDto(
            geographicCoordinates = null,
            country = CommonValues.country1,
            postCode = CommonValues.postCode1,
            city = CommonValues.city1,
            street = StreetDto(CommonValues.street1, CommonValues.houseNumber1),
        )
    )

    val postalAddress2 = PhysicalPostalAddressDto(
        industrialZone = CommonValues.industrialZone2,
        building = CommonValues.building2,
        floor = CommonValues.floor2,
        door = CommonValues.door2,
        areaPart = AreaDistrictDto(
            administrativeAreaLevel1 = CommonValues.adminAreaLevel1RegionCode_2,
            administrativeAreaLevel2 = CommonValues.county2,
            district = CommonValues.district2,
        ),
        baseAddress = BasePostalAddressDto(
            geographicCoordinates = null,
            country = CommonValues.country2,
            postCode = CommonValues.postCode2,
            city = CommonValues.city2,
            street = StreetDto(CommonValues.street2, CommonValues.houseNumber2),
        )
    )

    val postalAddress3 = PhysicalPostalAddressDto(
        industrialZone = CommonValues.industrialZone3,
        building = CommonValues.building3,
        floor = CommonValues.floor3,
        door = CommonValues.door3,
        areaPart = AreaDistrictDto(
            administrativeAreaLevel1 = CommonValues.adminAreaLevel1RegionCode_3,
            administrativeAreaLevel2 = CommonValues.county3,
            district = CommonValues.district3,
        ),
        baseAddress = BasePostalAddressDto(
            geographicCoordinates = null,
            country = CommonValues.country3,
            postCode = CommonValues.postCode3,
            city = CommonValues.city3,
            street = StreetDto(CommonValues.street3, CommonValues.houseNumber3),
        )
    )

    val logisticAddress1 = LogisticAddressDto(
        physicalPostalAddress = postalAddress1
    )

    val logisticAddress2 = LogisticAddressDto(
        physicalPostalAddress = postalAddress2,
    )

    val logisticAddress3 = LogisticAddressDto(
        physicalPostalAddress = postalAddress3,
    )


    val legalEntityCreate1 = LegalEntityPartnerCreateRequest(
        legalEntity = LegalEntityDto(
            legalName = name1,
            identifiers = listOf(identifier1),
            legalForm = CommonValues.legalFormTechnicalKey1,
            states = listOf(leStatus1),
            classifications = listOf(classification1, classification2),
            legalAddress = logisticAddress1
        ),
        index = CommonValues.index1
    )

    val legalEntityCreate2 = LegalEntityPartnerCreateRequest(
        legalEntity = LegalEntityDto(
            legalName = name3,
            identifiers = listOf(identifier2),
            legalForm = CommonValues.legalFormTechnicalKey2,
            states = listOf(leStatus2),
            classifications = listOf(classification3, classification4),
            legalAddress = logisticAddress2
        ),
        index = CommonValues.index2
    )

    val legalEntityCreate3 = LegalEntityPartnerCreateRequest(
        legalEntity = LegalEntityDto(
            legalName = name5,
            identifiers = listOf(identifier3),
            legalForm = CommonValues.legalFormTechnicalKey3,
            states = listOf(leStatus3),
            classifications = listOf(classification5),
            legalAddress = logisticAddress3
        ),
        index = CommonValues.index3
    )

    val legalEntityUpdate1 = LegalEntityPartnerUpdateRequest(
        bpn = CommonValues.bpnL1,
        legalEntity = legalEntityCreate1.legalEntity
    )

    val legalEntityUpdate2 = LegalEntityPartnerUpdateRequest(
        bpn = CommonValues.bpnL2,
        legalEntity = legalEntityCreate2.legalEntity
    )

    val legalEntityUpdate3 = LegalEntityPartnerUpdateRequest(
        bpn = CommonValues.bpnL3,
        legalEntity = legalEntityCreate3.legalEntity
    )

    val siteCreate1 = SitePartnerCreateRequest(
        site = SiteDto(
            name = CommonValues.siteName1,
            states = listOf(siteStatus1),
            mainAddress = logisticAddress1
        ),
        index = CommonValues.index1,
        bpnParent = legalEntityUpdate1.bpn
    )

    val siteCreate2 = SitePartnerCreateRequest(
        site = SiteDto(
            name = CommonValues.siteName2,
            states = listOf(siteStatus2),
            mainAddress = logisticAddress2
        ),
        index = CommonValues.index2,
        bpnParent = legalEntityUpdate2.bpn
    )

    val siteCreate3 = SitePartnerCreateRequest(
        site = SiteDto(
            name = CommonValues.siteName3,
            states = listOf(siteStatus3),
            mainAddress = logisticAddress3
        ),
        index = CommonValues.index3,
        bpnParent = legalEntityUpdate3.bpn
    )

    val siteUpdate1 = SitePartnerUpdateRequest(
        bpn = CommonValues.bpnS1,
        site = siteCreate1.site
    )

    val siteUpdate2 = SitePartnerUpdateRequest(
        bpn = CommonValues.bpnS2,
        site = siteCreate2.site
    )

    val siteUpdate3 = SitePartnerUpdateRequest(
        bpn = CommonValues.bpnS3,
        site = siteCreate3.site
    )

    val addressPartnerCreate1 = AddressPartnerCreateRequest(
        address = logisticAddress1,
        bpnParent = legalEntityUpdate1.bpn,
        index = CommonValues.index1
    )

    val addressPartnerCreate2 = AddressPartnerCreateRequest(
        address = logisticAddress2,
        bpnParent = legalEntityUpdate2.bpn,
        index = CommonValues.index2
    )

    val addressPartnerCreate3 = AddressPartnerCreateRequest(
        address = logisticAddress3,
        bpnParent = legalEntityUpdate3.bpn,
        index = CommonValues.index3
    )

    val addressPartnerUpdate1 = AddressPartnerUpdateRequest(
        bpn = CommonValues.bpnA1,
        address = logisticAddress1
    )

    val addressPartnerUpdate2 = AddressPartnerUpdateRequest(
        bpn = CommonValues.bpnA2,
        address = logisticAddress2
    )

    val addressPartnerUpdate3 = AddressPartnerUpdateRequest(
        bpn = CommonValues.bpnA3,
        address = logisticAddress3
    )

    val partnerStructure1 = LegalEntityStructureRequest(
        legalEntityCreate1,
        listOf(SiteStructureRequest(siteCreate1, listOf(addressPartnerCreate1)))
    )
}