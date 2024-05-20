---
{{/*
################################################################################
# Copyright (c) 2021,2024 Contributors to the Eclipse Foundation
#
# See the NOTICE file(s) distributed with this work for additional
# information regarding copyright ownership.
#
# This program and the accompanying materials are made available under the
# terms of the Apache License, Version 2.0 which is available at
# https://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# SPDX-License-Identifier: Apache-2.0
################################################################################
*/}}

{{- define "bpdm.keycloakRealm.tpl" -}}
realm: CX-Central
notBefore: 0
defaultSignatureAlgorithm: RS256
revokeRefreshToken: false
refreshTokenMaxReuse: 0
accessTokenLifespan: 300
accessTokenLifespanForImplicitFlow: 900
ssoSessionIdleTimeout: 1800
ssoSessionMaxLifespan: 36000
ssoSessionIdleTimeoutRememberMe: 0
ssoSessionMaxLifespanRememberMe: 0
offlineSessionIdleTimeout: 2592000
offlineSessionMaxLifespanEnabled: false
offlineSessionMaxLifespan: 5184000
clientSessionIdleTimeout: 0
clientSessionMaxLifespan: 0
clientOfflineSessionIdleTimeout: 0
clientOfflineSessionMaxLifespan: 0
accessCodeLifespan: 60
accessCodeLifespanUserAction: 300
accessCodeLifespanLogin: 1800
actionTokenGeneratedByAdminLifespan: 43200
actionTokenGeneratedByUserLifespan: 300
oauth2DeviceCodeLifespan: 600
oauth2DevicePollingInterval: 5
enabled: true
sslRequired: external
registrationAllowed: false
registrationEmailAsUsername: false
rememberMe: false
verifyEmail: false
loginWithEmailAllowed: true
duplicateEmailsAllowed: false
resetPasswordAllowed: false
editUsernameAllowed: false
bruteForceProtected: false
permanentLockout: false
maxFailureWaitSeconds: 900
minimumQuickLoginWaitSeconds: 60
waitIncrementSeconds: 60
quickLoginCheckMilliSeconds: 1000
maxDeltaTimeSeconds: 43200
failureFactor: 30
roles:
  realm:
    - id: 9513df5d-b3d6-4ddc-ba01-7323d37a0495
      name: uma_authorization
      description: "${role_uma_authorization}"
      composite: false
      clientRole: false
      containerId: 4c4a93a5-732b-4bfc-9460-afcf0b0c395b
      attributes: {}
    - id: bd0986e0-e389-4ed4-a000-90e8eecab7db
      name: offline_access
      description: "${role_offline-access}"
      composite: false
      clientRole: false
      containerId: 4c4a93a5-732b-4bfc-9460-afcf0b0c395b
      attributes: {}
    - id: 8cc5b94a-aadd-434b-9006-21abca12bdca
      name: default-roles-cx-central
      description: "${role_default-roles}"
      composite: true
      composites:
        realm:
          - offline_access
          - uma_authorization
        client:
          account:
            - manage-account
            - view-profile
      clientRole: false
      containerId: 4c4a93a5-732b-4bfc-9460-afcf0b0c395b
      attributes: {}
  client:
    BPDM-ORCHESTRATOR:
      - id: 15799727-d685-4605-8d74-68bf657bd9ff
        name: create_result_cleanAndSync
        description: Create results for golden record tasks which are reserved in step
          'CleanAndSync'
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
      - id: 82cf47d2-d79a-46ad-9e27-56c2a52dc92d
        name: create_result_poolSync
        description: Create results for golden record tasks which are reserved in step
          'PoolSync'
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
      - id: aeb29ec7-340a-40ef-8df0-f5b2326b8b96
        name: create_reservation_clean
        description: Create reservations for golden record tasks queued for step 'Clean'
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
      - id: dffcb634-6892-4d18-9125-f171dd1cf7d2
        name: create_result_clean
        description: Create results for golden record tasks which are reserved in step
          'Clean'
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
      - id: da2cbf9b-7789-44d0-9ec3-f05de3738754
        name: create_reservation_cleanAndSync
        description: Create reservations for golden record tasks queued for step 'CleanAndSync'
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
      - id: 32c93533-2ac1-48c4-bca5-c025e92d97ab
        name: create_reservation_poolSync
        description: Create reservations for golden record tasks queued for step 'PoolSync'
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
      - id: 40f7ed50-5e55-415f-8afc-dde3b5ffb1ac
        name: read_task
        description: Read access to Golden Record Tasks, like status and business partner
          data
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
      - id: 5d1522d8-0922-4a5a-af4d-9950bb90e836
        name: create_task
        description: Create new Golden Record Tasks to process business partner data
        composite: false
        clientRole: true
        containerId: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
        attributes: {}
    realm-management:
      - id: e7d6b4cc-a98a-47ff-b821-82d5ea0ba118
        name: view-identity-providers
        description: "${role_view-identity-providers}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: a531cdc3-e4d1-43f0-aaeb-118981b5dbd8
        name: manage-realm
        description: "${role_manage-realm}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: ecd6a2b2-68b2-4893-b087-f3893a4930fb
        name: query-groups
        description: "${role_query-groups}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 84e13f19-3b6a-4110-9ff9-b99627b97faf
        name: realm-admin
        description: "${role_realm-admin}"
        composite: true
        composites:
          client:
            realm-management:
              - view-identity-providers
              - manage-realm
              - query-groups
              - manage-identity-providers
              - impersonation
              - view-authorization
              - query-realms
              - manage-users
              - create-client
              - manage-authorization
              - view-users
              - view-clients
              - query-users
              - view-events
              - manage-clients
              - manage-events
              - view-realm
              - query-clients
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: cbc7c286-d80d-4645-8d9f-fd2ad205d56b
        name: manage-identity-providers
        description: "${role_manage-identity-providers}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: be12eeca-101b-4a7c-a8fa-e9ffbd4c4ff6
        name: impersonation
        description: "${role_impersonation}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: d06ed43b-5505-4e18-80fd-ad094fe61ebd
        name: view-authorization
        description: "${role_view-authorization}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 60dc59c4-7dd4-4d8b-b52a-4cb7d8a93d55
        name: query-realms
        description: "${role_query-realms}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 913aeb1d-5d7e-49e9-b30c-78894c1f7e20
        name: manage-users
        description: "${role_manage-users}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 60df7b56-4015-4bc3-a94c-72ac39068625
        name: create-client
        description: "${role_create-client}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 39e3bbe1-6dfb-42e3-93cc-34eaaf8ffa3b
        name: manage-authorization
        description: "${role_manage-authorization}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: f3a05cd1-7be3-4729-8307-28e2d3db05fa
        name: view-clients
        description: "${role_view-clients}"
        composite: true
        composites:
          client:
            realm-management:
              - query-clients
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 4694f0f6-2df3-4304-b845-6171f21f5525
        name: view-users
        description: "${role_view-users}"
        composite: true
        composites:
          client:
            realm-management:
              - query-groups
              - query-users
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 5044c64e-873c-4998-832a-13d24feab927
        name: query-users
        description: "${role_query-users}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: f98f91b1-443f-4656-854b-fcacea1837c6
        name: view-events
        description: "${role_view-events}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 10fb316b-f36e-46d1-9722-7f3b4a7a6b51
        name: manage-clients
        description: "${role_manage-clients}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 70555deb-cf27-48c8-ad5e-7f4c65f79561
        name: manage-events
        description: "${role_manage-events}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: f8b59beb-1193-4e37-ad70-c1e873f67f0c
        name: query-clients
        description: "${role_query-clients}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
      - id: 41317d7c-878c-4a78-b043-95e65db54935
        name: view-realm
        description: "${role_view-realm}"
        composite: false
        clientRole: true
        containerId: 18a86c55-5db4-4f23-90de-e090fbdcf30f
        attributes: {}
    DUMMY-ORCHESTRATOR-TASK_PROCESSOR: []
    EDC-GATE-INPUT-CONSUMER: []
    POOL-ORCHESTRATOR-TASK-PROCESSOR: []
    security-admin-console: []
    GATE-POOL-SHARING_MEMBER: []
    BPDM-GATE:
      - id: 704ec1b9-bac0-4311-a2bf-e85668831634
        name: write_sharing_state
        description: Update the business partner sharing state
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
      - id: aedbe60d-33a0-41de-a72e-34044da54c31
        name: read_output_partner
        description: Read access to business partner output data
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
      - id: dd602f80-1f05-4898-bf8f-6ff79fe37c44
        name: read_input_changelog
        description: Read access to the update event-log for business partner input
          data
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
      - id: 17111a41-1498-4fef-819e-6f8fe373c97d
        name: read_output_changelog
        description: Read access to the update event-log for business partner output
          data
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
      - id: 1afe9c0d-a452-4116-b734-6aab9a25409e
        name: read_stats
        description: Read access to business partner aggregated statistics of this Gate
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
      - id: 155ce4fa-8305-4eb4-b720-6ef44f0ffdaa
        name: read_sharing_state
        description: Read access to the business partner sharing state
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
      - id: 272afdde-f10f-404e-ac93-ccd197e03176
        name: write_input_partner
        description: Create and update business partner input data
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
      - id: 34adcdb7-6992-429c-a183-0dc35a1dd2f0
        name: read_input_partner
        description: Read access to business partner input data
        composite: false
        clientRole: true
        containerId: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
        attributes: {}
    account-console: []
    EDC-GATE-OUTPUT-CONSUMER: []
    broker:
      - id: aa857fa3-bc93-41b5-b25b-7749de04ed35
        name: read-token
        description: "${role_read-token}"
        composite: false
        clientRole: true
        containerId: d21dfeff-f2e6-4a6d-b32b-7e1eb6bfa32f
        attributes: {}
    EDC-GATE-INPUT-MANAGER: []
    CLEAN_AND_SYNC_ORCHESTRATOR-TASK-PROCESSOR: []
    admin-cli: []
    CLEANER-ORCHESTRATOR-TASK-PROCESSOR: []
    EDC-POOL-READ-MEMBER: []
    BPDM-POOL:
      - id: 85da7220-27a3-422f-96a0-ebc62cc432bb
        name: read_partner_member
        description: Read access to Golden Records that belong to Catena-X members
        composite: false
        clientRole: true
        containerId: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
        attributes: {}
      - id: f4507b4f-e3aa-493c-86fb-6cef25080bb8
        name: read_metadata
        description: Read access to available metadata Golden Records can refer to.
          For example available identifier types, legal forms and so on.
        composite: false
        clientRole: true
        containerId: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
        attributes: {}
      - id: 58955f8f-1f8a-436d-b950-d43bc86d95c3
        name: write_metadata
        description: Create and update available metadata Golden Records can refer to.
          For example available identifier types, legal forms and so on.
        composite: false
        clientRole: true
        containerId: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
        attributes: {}
      - id: 7ba6cd78-d352-474d-b72c-9f20ff347dab
        name: write_partner
        description: Create and update access for all Golden Records in the Pool
        composite: false
        clientRole: true
        containerId: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
        attributes: {}
      - id: 891fe14c-2f04-4b69-9c7c-c281bcd85859
        name: read_changelog
        description: Read access to update event-log for all Golden Records
        composite: false
        clientRole: true
        containerId: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
        attributes: {}
      - id: 1c9e8240-7da7-4a49-b1e8-d451f3716e5b
        name: read_partner
        description: Read access to all Golden Records in the Pool
        composite: false
        clientRole: true
        containerId: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
        attributes: {}
      - id: ccb03d1b-7f12-4ffe-a14a-dfe5d2bffaea
        name: read_changelog_member
        description: Read access to update event-log for Golden Records that belong
          to Catena-X members
        composite: false
        clientRole: true
        containerId: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
        attributes: {}
    account:
      - id: e775ef80-32c9-4c8b-b738-031dd1529dd7
        name: view-consent
        description: "${role_view-consent}"
        composite: false
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
      - id: aff81b83-4df7-4b4e-a562-20d2a004d5ee
        name: manage-consent
        description: "${role_manage-consent}"
        composite: true
        composites:
          client:
            account:
              - view-consent
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
      - id: ff080322-12b4-48b6-b2b2-8a287b6643eb
        name: view-groups
        description: "${role_view-groups}"
        composite: false
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
      - id: 65424883-84bb-4e4d-aac5-f04f97d46596
        name: delete-account
        description: "${role_delete-account}"
        composite: false
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
      - id: b5524960-9182-4f8a-8c6f-c1cf1a346e0e
        name: manage-account
        description: "${role_manage-account}"
        composite: true
        composites:
          client:
            account:
              - manage-account-links
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
      - id: d59c1db4-005b-47b7-bd16-cacf776da2ac
        name: manage-account-links
        description: "${role_manage-account-links}"
        composite: false
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
      - id: 4872441f-1aa1-41ab-9859-12bf5e117212
        name: view-profile
        description: "${role_view-profile}"
        composite: false
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
      - id: c4a2e5cb-844f-42ea-9090-d1b215859e60
        name: view-applications
        description: "${role_view-applications}"
        composite: false
        clientRole: true
        containerId: 1098ae9a-efd2-4df1-a400-f7512604dbab
        attributes: {}
    GATE-ORCHESTRATOR-TASK_CREATOR: []
groups:
  - id: c315e0af-9576-4b07-a8ab-5251c01e1b0e
    name: BPDM
    path: "/BPDM"
    attributes: {}
    realmRoles: []
    clientRoles: {}
    subGroups:
      - id: 144be168-6afb-42d5-8154-b7eccf7d2ede
        name: Gate
        path: "/BPDM/Gate"
        attributes: {}
        realmRoles: []
        clientRoles: {}
        subGroups:
          - id: 65bffc93-e856-4be9-a8d2-7851c67899c7
            name: Admin
            path: "/BPDM/Gate/Admin"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-GATE:
                - write_sharing_state
                - read_output_partner
                - read_input_changelog
                - read_stats
                - read_output_changelog
                - write_input_partner
                - read_sharing_state
                - read_input_partner
            subGroups: []
          - id: d0cbde40-4896-4484-bff4-8666d2ad1a14
            name: Input Consumer
            path: "/BPDM/Gate/Input Consumer"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-GATE:
                - read_input_changelog
                - read_stats
                - read_sharing_state
                - read_input_partner
            subGroups: []
          - id: c7d75c3c-5580-4a55-8ff2-c9729031a213
            name: Input Manager
            path: "/BPDM/Gate/Input Manager"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-GATE:
                - write_sharing_state
                - read_input_changelog
                - read_stats
                - write_input_partner
                - read_sharing_state
                - read_input_partner
            subGroups: []
          - id: a66cad54-3ff3-4673-88ea-304892073e13
            name: Output Consumer
            path: "/BPDM/Gate/Output Consumer"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-GATE:
                - read_output_partner
                - read_stats
                - read_output_changelog
                - read_sharing_state
            subGroups: []
      - id: 8f30ca01-ea43-4883-a65f-db05cc8aa044
        name: Orchestrator
        path: "/BPDM/Orchestrator"
        attributes: {}
        realmRoles: []
        clientRoles: {}
        subGroups:
          - id: e0e98e6f-146f-4250-9f09-edd32c03a3a1
            name: Admin
            path: "/BPDM/Orchestrator/Admin"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-ORCHESTRATOR:
                - create_result_cleanAndSync
                - create_result_poolSync
                - create_result_clean
                - create_reservation_clean
                - create_reservation_poolSync
                - create_reservation_cleanAndSync
                - read_task
                - create_task
            subGroups: []
          - id: 719c9fa3-6c84-4847-85a0-5655f2b11adb
            name: Clean And Sync Task Processor
            path: "/BPDM/Orchestrator/Clean And Sync Task Processor"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-ORCHESTRATOR:
                - create_result_cleanAndSync
                - create_reservation_cleanAndSync
            subGroups: []
          - id: 7d393838-527b-4fbc-8748-25cdd39236b8
            name: Cleaning Task Processor
            path: "/BPDM/Orchestrator/Cleaning Task Processor"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-ORCHESTRATOR:
                - create_reservation_clean
                - create_result_clean
            subGroups: []
          - id: b6843b52-d9c9-4c65-964b-f0fb5b2af4fc
            name: Pool Task Processor
            path: "/BPDM/Orchestrator/Pool Task Processor"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-ORCHESTRATOR:
                - create_result_poolSync
                - create_reservation_poolSync
            subGroups: []
          - id: 9c0747bf-d4fb-4d05-91ed-a2b2db795247
            name: Task Creator
            path: "/BPDM/Orchestrator/Task Creator"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-ORCHESTRATOR:
                - read_task
                - create_task
            subGroups: []
      - id: 52eb4acd-dcb9-4643-b124-696c42c42791
        name: Pool
        path: "/BPDM/Pool"
        attributes: {}
        realmRoles: []
        clientRoles: {}
        subGroups:
          - id: 882b6304-5546-41ef-b8ba-9f4a3acd7b3d
            name: Admin
            path: "/BPDM/Pool/Admin"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-POOL:
                - read_partner_member
                - read_metadata
                - write_metadata
                - write_partner
                - read_partner
                - read_changelog
                - read_changelog_member
            subGroups: []
          - id: 35cb3147-a4e4-4439-b11e-006ec710ca05
            name: Cx Member
            path: "/BPDM/Pool/Cx Member"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-POOL:
                - read_partner_member
                - read_metadata
                - read_changelog_member
            subGroups: []
          - id: 33bb68db-d1f1-43b6-88b4-f8e46564eac7
            name: Sharing Member
            path: "/BPDM/Pool/Sharing Member"
            attributes: {}
            realmRoles: []
            clientRoles:
              BPDM-POOL:
                - read_partner_member
                - read_metadata
                - read_changelog
                - read_changelog_member
            subGroups: []
  - id: c4487a2c-5688-47a1-9e85-cc53b75931a6
    name: Test Company
    path: "/Test Company"
    attributes:
      BPN:
        - BPNL000000000010
    realmRoles: []
    clientRoles: {}
    subGroups: []
defaultRole:
  id: 8cc5b94a-aadd-434b-9006-21abca12bdca
  name: default-roles-cx-central
  description: "${role_default-roles}"
  composite: true
  clientRole: false
  containerId: 4c4a93a5-732b-4bfc-9460-afcf0b0c395b
requiredCredentials:
  - password
otpPolicyType: totp
otpPolicyAlgorithm: HmacSHA1
otpPolicyInitialCounter: 0
otpPolicyDigits: 6
otpPolicyLookAheadWindow: 1
otpPolicyPeriod: 30
otpPolicyCodeReusable: false
otpSupportedApplications:
  - totpAppGoogleName
  - totpAppMicrosoftAuthenticatorName
  - totpAppFreeOTPName
webAuthnPolicyRpEntityName: keycloak
webAuthnPolicySignatureAlgorithms:
  - ES256
webAuthnPolicyRpId: ''
webAuthnPolicyAttestationConveyancePreference: not specified
webAuthnPolicyAuthenticatorAttachment: not specified
webAuthnPolicyRequireResidentKey: not specified
webAuthnPolicyUserVerificationRequirement: not specified
webAuthnPolicyCreateTimeout: 0
webAuthnPolicyAvoidSameAuthenticatorRegister: false
webAuthnPolicyAcceptableAaguids: []
webAuthnPolicyPasswordlessRpEntityName: keycloak
webAuthnPolicyPasswordlessSignatureAlgorithms:
  - ES256
webAuthnPolicyPasswordlessRpId: ''
webAuthnPolicyPasswordlessAttestationConveyancePreference: not specified
webAuthnPolicyPasswordlessAuthenticatorAttachment: not specified
webAuthnPolicyPasswordlessRequireResidentKey: not specified
webAuthnPolicyPasswordlessUserVerificationRequirement: not specified
webAuthnPolicyPasswordlessCreateTimeout: 0
webAuthnPolicyPasswordlessAvoidSameAuthenticatorRegister: false
webAuthnPolicyPasswordlessAcceptableAaguids: []
users:
  - id: 8ca178d6-8a85-47e0-b03e-d514c7f19ea1
    createdTimestamp: 1712550075280
    username: cx-user
    enabled: true
    totp: false
    emailVerified: false
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/Test Company"
  - id: b4435700-b242-47c4-a2a4-790921a9e338
    createdTimestamp: 1712545325418
    username: service-account-bpdm-gate
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: BPDM-GATE
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Gate/Admin"
      - "/Test Company"
  - id: f560149a-98b0-4d4d-ac3c-9299f6650473
    createdTimestamp: 1712546117578
    username: service-account-bpdm-orchestrator
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: BPDM-ORCHESTRATOR
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Orchestrator/Admin"
  - id: abe0c1fa-a3e9-496b-8c3f-1147456b35c2
    createdTimestamp: 1712483922963
    username: service-account-bpdm-pool
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: BPDM-POOL
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Pool/Admin"
  - id: bb01a9a8-be07-42a2-9839-88e7a1aea9b2
    createdTimestamp: 1713242615747
    username: service-account-clean_and_sync_orchestrator-task-processor
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: CLEAN_AND_SYNC_ORCHESTRATOR-TASK-PROCESSOR
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Orchestrator/Clean And Sync Task Processor"
  - id: ab749a25-5d11-4142-8f94-9a7ab8b17032
    createdTimestamp: 1712549122422
    username: service-account-cleaner-orchestrator-task-processor
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: CLEANER-ORCHESTRATOR-TASK-PROCESSOR
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Orchestrator/Cleaning Task Processor"
  - id: 317b906e-e3a3-4269-aff8-e88b69f21401
    createdTimestamp: 1713242703352
    username: service-account-dummy-orchestrator-task_processor
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: DUMMY-ORCHESTRATOR-TASK_PROCESSOR
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Orchestrator/Clean And Sync Task Processor"
      - "/BPDM/Orchestrator/Cleaning Task Processor"
  - id: ecb17d50-5258-4742-a75d-7130362e6844
    createdTimestamp: 1712548563721
    username: service-account-edc-gate-input-consumer
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: EDC-GATE-INPUT-CONSUMER
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Gate/Input Consumer"
      - "/Test Company"
  - id: 826b7e7f-283c-49ec-a0e9-685725811588
    createdTimestamp: 1712548310534
    username: service-account-edc-gate-input-manager
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: EDC-GATE-INPUT-MANAGER
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Gate/Input Manager"
      - "/Test Company"
  - id: 3ea92c97-c2ef-4603-978a-4d190a113be9
    createdTimestamp: 1712548668640
    username: service-account-edc-gate-output-consumer
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: EDC-GATE-OUTPUT-CONSUMER
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Gate/Output Consumer"
      - "/Test Company"
  - id: cc28ac6f-b1e3-44b9-8558-813e5704dda1
    createdTimestamp: 1712547159077
    username: service-account-edc-pool-read-member
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: EDC-POOL-READ-MEMBER
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Pool/Cx Member"
  - id: 2586457b-a8ba-44a4-9af0-b8e49e7e42a7
    createdTimestamp: 1712548886761
    username: service-account-gate-orchestrator-task_creator
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: GATE-ORCHESTRATOR-TASK_CREATOR
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Orchestrator/Task Creator"
  - id: 55abb22a-81d7-489b-9463-b84c82134b1b
    createdTimestamp: 1712548794528
    username: service-account-gate-pool-sharing_member
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: GATE-POOL-SHARING_MEMBER
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Pool/Sharing Member"
  - id: c6ef3346-a441-4c06-93e5-b82b1ce85f22
    createdTimestamp: 1712549280628
    username: service-account-pool-orchestrator-task-processor
    enabled: true
    totp: false
    emailVerified: false
    serviceAccountClientId: POOL-ORCHESTRATOR-TASK-PROCESSOR
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/BPDM/Orchestrator/Pool Task Processor"
  - id: 80989cb1-e5b6-4a50-951c-981323e56f0e
    createdTimestamp: 1712550045808
    username: service-manager
    enabled: true
    totp: false
    emailVerified: false
    credentials: []
    disableableCredentialTypes: []
    requiredActions: []
    realmRoles:
      - default-roles-cx-central
    notBefore: 0
    groups:
      - "/Test Company"
scopeMappings:
  - clientScope: offline_access
    roles:
      - offline_access
clientScopeMappings:
  account:
    - client: account-console
      roles:
        - manage-account
        - view-groups
clients:
  - id: 0562ecfa-f17b-4d32-86cc-061f7da34b6b
    clientId: BPDM-GATE
    name: BPDM Gate
    description: Client for the BPDM Gate applications
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      client.secret.creation.time: '1712545325'
      backchannel.logout.session.required: 'true'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 60deb2d6-dcf6-4d26-b27d-6c5879dfc0c2
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: d85e14c7-5f1e-479f-9fa6-8ef78c5496c4
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
      - id: 7029488a-1de6-44a5-a060-34c9cecb873a
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - BPN
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 6a172a2a-78a7-435f-8e95-da46eba4eeb1
    clientId: BPDM-ORCHESTRATOR
    name: BPDM Orchestrator
    description: Client for the BPDM Orchestrator application
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      client.secret.creation.time: '1712546117'
      backchannel.logout.session.required: 'true'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 27a097d7-80fa-4470-bce1-5b8a5bb0f910
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: 370d16be-4c43-4f5a-aa8a-96d3521cf53a
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: eea13c39-4cea-44f7-a699-90b74e60f871
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 98bf1231-f0ee-42e4-9ec4-d3831369cf40
    clientId: BPDM-POOL
    name: BPDM Pool
    description: Client for the BPDM Pool
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      client.secret.creation.time: '1712483922'
      backchannel.logout.session.required: 'true'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: '0918b849-f546-470c-a167-2902d0ebc27f'
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 107c10db-d91b-4169-9dfb-f72acae886ec
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
      - id: 61caa82d-3ee2-45ce-b00d-5f9e0a49ec85
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: bc09e8be-a268-4237-a234-f40761221863
    clientId: CLEANER-ORCHESTRATOR-TASK-PROCESSOR
    name: Cleaner Orchestrator Task Processing
    description: Example of a client for a cleaning service inside the Golden Record
      Process acting as a task processor for the Orchestrator.
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      client.secret.creation.time: '1712549122'
      backchannel.logout.session.required: 'true'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 3fa6d7e8-b52c-4197-a1e2-5b46000cdc51
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
      - id: ee8fd919-c838-41eb-8195-59e7373e685f
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 6838565a-917a-42d2-bdf2-d2c78f9eaf8f
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 78044a95-a256-4985-a3a8-49a3bd78013f
    clientId: CLEAN_AND_SYNC_ORCHESTRATOR-TASK-PROCESSOR
    name: Clean And Sync Task Processor
    description: ''
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      client.secret.creation.time: '1713242615'
      backchannel.logout.session.required: 'true'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 3a62e181-b881-4741-ac5f-a243492f2bf8
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 4c7a2e41-f282-4540-a82b-f0b2fbdc06f3
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: 702b0a58-7d33-44a2-8c4e-c80f52a58ea4
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - BPN
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 53250ac1-77f0-41c6-bc52-ee92443740e9
    clientId: DUMMY-ORCHESTRATOR-TASK_PROCESSOR
    secret: "{{ .Values.keycloak.bpdm.realm.clientSecrets.cleaningDummyOrchestrator }}"
    name: Cleaning Dummy Task Processor
    description: ''
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      oauth2.device.authorization.grant.enabled: 'false'
      client.secret.creation.time: '1713242703'
      backchannel.logout.session.required: 'true'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 7eac665e-3e66-460a-a9dc-f511ac9dae2f
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: 46d589db-ba66-4cc0-91d6-b155224c4c98
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
      - id: b3768658-f0f2-4860-89a6-2f08ecf70f80
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - BPN
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: c23dd3be-c2bc-41a5-b9ce-057068642b2f
    clientId: EDC-GATE-INPUT-CONSUMER
    name: EDC Gate Input Consumer
    description: 'Example client for an EDC asset of type "cx-taxo:ReadAccessGateInputForSharingMember" '
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      client.secret.creation.time: '1712548563'
      backchannel.logout.session.required: 'true'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: ecfc775a-eb01-4dcd-8d00-4deaeb4c3c58
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 957e8bfa-4f10-4e7f-bc89-016938e1c9e6
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: 4005125a-0036-4f78-a3d4-df9c0604df09
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - BPN
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: a98e0c69-6e9c-4356-b877-9f9335c73de0
    clientId: EDC-GATE-INPUT-MANAGER
    name: EDC Gate Input Manager
    description: 'Example client for an EDC asset of type "cx-taxo:FullAccessGateInputForSharingMember" '
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      client.secret.creation.time: '1712548310'
      backchannel.logout.session.required: 'true'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: a9e23088-b448-45be-accf-bd76391b59e0
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: de85d180-ad42-48a3-be89-8c2a98696215
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
      - id: 7a56e9fd-71a6-4c6d-88eb-14619e6e9461
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - BPN
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 3477a608-0342-4f48-a5c5-9a2fd093a69f
    clientId: EDC-GATE-OUTPUT-CONSUMER
    name: EDC Gate Output Consumer
    description: 'Example client for an EDC asset of type "cx-taxo:ReadAccessGateOutputForSharingMember" '
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      client.secret.creation.time: '1712548668'
      backchannel.logout.session.required: 'true'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 5215aba9-0bae-4657-9cb5-3cebbec1c0f1
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
      - id: 5fe494ce-2e13-44a5-8a4d-760c2ba3dad0
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 15bc5c6d-2745-4298-aac1-16cf643dde1b
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - BPN
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 5acb618f-3371-4aaf-8b47-a0afa4a175d3
    clientId: EDC-POOL-READ-MEMBER
    name: EDC Pool Member
    description: 'Example client for an EDC asset of type "cx-taxo:ReadAccessPoolForCatenaXMember" '
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      client.secret.creation.time: '1712547159'
      backchannel.logout.session.required: 'true'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      display.on.consent.screen: 'false'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 5924c70a-bd90-4b2c-9931-0c4ad2fa2f08
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 6545a3e3-308b-40db-a0be-71814c318170
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: a433dd64-f67c-4138-8493-6c01b71caebe
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: f7b246f6-ac71-4855-9acc-52ec8f6264fd
    clientId: GATE-ORCHESTRATOR-TASK_CREATOR
    secret: {{ .Values.keycloak.bpdm.realm.clientSecrets.gateOrchestrator }}
    name: Gate Orchestrator Task Creator
    description: Example client for a Gate application acting as a Golden Record Task
      creator for the Orchestraror
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      client.secret.creation.time: '1712548886'
      backchannel.logout.session.required: 'true'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 9f9b8196-962e-4e84-9cca-b464d3e8d069
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 75cf2d9d-5270-4fd3-a3bf-f1ab6005ff82
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
      - id: 0e7521e3-0268-483f-9904-434cd27118c6
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 5e7aaf85-5ee8-4e29-b511-25a557824472
    clientId: GATE-POOL-SHARING_MEMBER
    secret: {{ .Values.keycloak.bpdm.realm.clientSecrets.gatePool }}
    name: Gate Pool Sharing Member
    description: Example client for a Gate application that acts as a sharing member
      for accessing the Pool
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      client.secret.creation.time: '1712548794'
      backchannel.logout.session.required: 'true'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: f748f1b1-8067-4f77-b540-fb4b8e32b3b2
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: 7d6e2d07-f97c-4eda-95b5-b41c36640194
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 84f7e842-3196-4d5e-9b81-8408c2de40df
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 907c064f-2c69-45da-a949-2b64d656bc94
    clientId: POOL-ORCHESTRATOR-TASK-PROCESSOR
    secret: {{ .Values.keycloak.bpdm.realm.clientSecrets.poolOrchestrator }}
    name: Pool Orchestrator Task Processor
    description: Example client for the Pool acting as a task processor for the Orchestrator
    rootUrl: ''
    adminUrl: ''
    baseUrl: ''
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/*"
    webOrigins:
      - "/*"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: true
    publicClient: false
    frontchannelLogout: true
    protocol: openid-connect
    attributes:
      oidc.ciba.grant.enabled: 'false'
      post.logout.redirect.uris: "+"
      oauth2.device.authorization.grant.enabled: 'false'
      client.secret.creation.time: '1712549280'
      backchannel.logout.session.required: 'true'
      backchannel.logout.revoke.offline.tokens: 'false'
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: true
    nodeReRegistrationTimeout: -1
    protocolMappers:
      - id: 338cc31d-e1ab-4b24-b7e4-2b5dc457400e
        name: Client IP Address
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientAddress
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientAddress
          jsonType.label: String
      - id: 75eb5277-bcfd-47ca-a941-f3e0be4dba2b
        name: Client Host
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: clientHost
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: clientHost
          jsonType.label: String
      - id: 4a411062-59fd-4d9d-b97a-78d0cec6336c
        name: Client ID
        protocol: openid-connect
        protocolMapper: oidc-usersessionmodel-note-mapper
        consentRequired: false
        config:
          user.session.note: client_id
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: client_id
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 1098ae9a-efd2-4df1-a400-f7512604dbab
    clientId: account
    name: "${client_account}"
    rootUrl: "${authBaseUrl}"
    baseUrl: "/realms/CX-Central/account/"
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/realms/CX-Central/account/*"
    webOrigins: []
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: true
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: false
    publicClient: true
    frontchannelLogout: false
    protocol: openid-connect
    attributes:
      post.logout.redirect.uris: "+"
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: false
    nodeReRegistrationTimeout: 0
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: abcafcc8-d4e9-4419-8d2c-ef38a930da60
    clientId: account-console
    name: "${client_account-console}"
    rootUrl: "${authBaseUrl}"
    baseUrl: "/realms/CX-Central/account/"
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/realms/CX-Central/account/*"
    webOrigins: []
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: true
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: false
    publicClient: true
    frontchannelLogout: false
    protocol: openid-connect
    attributes:
      post.logout.redirect.uris: "+"
      pkce.code.challenge.method: S256
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: false
    nodeReRegistrationTimeout: 0
    protocolMappers:
      - id: 26c7efe6-c078-4369-88fd-113ef5273cd4
        name: audience resolve
        protocol: openid-connect
        protocolMapper: oidc-audience-resolve-mapper
        consentRequired: false
        config: {}
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 97e75ea8-c298-4705-9ea4-6cd5764734c4
    clientId: admin-cli
    name: "${client_admin-cli}"
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris: []
    webOrigins: []
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: false
    implicitFlowEnabled: false
    directAccessGrantsEnabled: true
    serviceAccountsEnabled: false
    publicClient: true
    frontchannelLogout: false
    protocol: openid-connect
    attributes:
      post.logout.redirect.uris: "+"
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: false
    nodeReRegistrationTimeout: 0
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: d21dfeff-f2e6-4a6d-b32b-7e1eb6bfa32f
    clientId: broker
    name: "${client_broker}"
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris: []
    webOrigins: []
    notBefore: 0
    bearerOnly: true
    consentRequired: false
    standardFlowEnabled: true
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: false
    publicClient: false
    frontchannelLogout: false
    protocol: openid-connect
    attributes:
      post.logout.redirect.uris: "+"
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: false
    nodeReRegistrationTimeout: 0
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 18a86c55-5db4-4f23-90de-e090fbdcf30f
    clientId: realm-management
    name: "${client_realm-management}"
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris: []
    webOrigins: []
    notBefore: 0
    bearerOnly: true
    consentRequired: false
    standardFlowEnabled: true
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: false
    publicClient: false
    frontchannelLogout: false
    protocol: openid-connect
    attributes:
      post.logout.redirect.uris: "+"
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: false
    nodeReRegistrationTimeout: 0
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
  - id: 2cb102bb-059a-4a56-a23f-699deb0fb6ba
    clientId: security-admin-console
    name: "${client_security-admin-console}"
    rootUrl: "${authAdminUrl}"
    baseUrl: "/admin/CX-Central/console/"
    surrogateAuthRequired: false
    enabled: true
    alwaysDisplayInConsole: false
    clientAuthenticatorType: client-secret
    redirectUris:
      - "/admin/CX-Central/console/*"
    webOrigins:
      - "+"
    notBefore: 0
    bearerOnly: false
    consentRequired: false
    standardFlowEnabled: true
    implicitFlowEnabled: false
    directAccessGrantsEnabled: false
    serviceAccountsEnabled: false
    publicClient: true
    frontchannelLogout: false
    protocol: openid-connect
    attributes:
      post.logout.redirect.uris: "+"
      pkce.code.challenge.method: S256
    authenticationFlowBindingOverrides: {}
    fullScopeAllowed: false
    nodeReRegistrationTimeout: 0
    protocolMappers:
      - id: 52a7dc9f-6c88-43bc-ab02-6113360eea95
        name: locale
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: locale
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: locale
          jsonType.label: String
    defaultClientScopes:
      - web-origins
      - acr
      - roles
      - profile
      - email
    optionalClientScopes:
      - address
      - phone
      - offline_access
      - microprofile-jwt
clientScopes:
  - id: 134c08cd-8ad7-4877-9731-a864045c2563
    name: roles
    description: OpenID Connect scope for add user roles to the access token
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'false'
      consent.screen.text: "${rolesScopeConsentText}"
      display.on.consent.screen: 'true'
    protocolMappers:
      - id: 40bbc7bb-bc17-4239-87b5-e0d35246c98a
        name: realm roles
        protocol: openid-connect
        protocolMapper: oidc-usermodel-realm-role-mapper
        consentRequired: false
        config:
          user.attribute: foo
          introspection.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: realm_access.roles
          jsonType.label: String
          multivalued: 'true'
      - id: 1ad03fff-9319-4ee8-9376-bef24882a378
        name: audience resolve
        protocol: openid-connect
        protocolMapper: oidc-audience-resolve-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          access.token.claim: 'true'
      - id: '09ee4791-697d-4f9b-9972-3f47511c8f82'
        name: client roles
        protocol: openid-connect
        protocolMapper: oidc-usermodel-client-role-mapper
        consentRequired: false
        config:
          user.attribute: foo
          introspection.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: resource_access.${client_id}.roles
          jsonType.label: String
          multivalued: 'true'
  - id: 51d12c36-1694-4699-92a0-c0b7eb2b222a
    name: profile
    description: 'OpenID Connect built-in scope: profile'
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'true'
      consent.screen.text: "${profileScopeConsentText}"
      display.on.consent.screen: 'true'
    protocolMappers:
      - id: 47bae019-ba1c-4ba2-88c3-37048ecfb436
        name: updated at
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: updatedAt
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: updated_at
          jsonType.label: long
      - id: 779b76d3-6cf2-4fea-b561-8944a15afb7c
        name: picture
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: picture
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: picture
          jsonType.label: String
      - id: ae554e5a-7f32-44c8-9b6f-9963ec91a3dc
        name: family name
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: lastName
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: family_name
          jsonType.label: String
      - id: 1274bf9d-ece2-4c43-b8ed-01829d7f8500
        name: profile
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: profile
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: profile
          jsonType.label: String
      - id: aae5e4ca-f5ed-46c6-9247-0a3592004c5e
        name: nickname
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: nickname
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: nickname
          jsonType.label: String
      - id: be4e04f2-736e-4e06-b9b0-0dc92dff9a28
        name: given name
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: firstName
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: given_name
          jsonType.label: String
      - id: 2d4fabcc-466b-42fc-87a4-af269398eace
        name: zoneinfo
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: zoneinfo
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: zoneinfo
          jsonType.label: String
      - id: c8763dde-a269-4104-be8f-c4fc224fa7c6
        name: birthdate
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: birthdate
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: birthdate
          jsonType.label: String
      - id: 0eed854c-bdab-4ee1-84c0-c8134d7c9283
        name: gender
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: gender
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: gender
          jsonType.label: String
      - id: dd5c71c1-a7f0-48e7-99ee-443ada1cc757
        name: locale
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: locale
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: locale
          jsonType.label: String
      - id: 6f6ae610-a3bc-48cd-8e0a-acc9d00a26ac
        name: website
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: website
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: website
          jsonType.label: String
      - id: a58f36a8-00bd-4acd-b285-fb24497ac4eb
        name: middle name
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: middleName
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: middle_name
          jsonType.label: String
      - id: 1e8aa878-5c35-493d-b135-f67274e300cb
        name: username
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: username
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: preferred_username
          jsonType.label: String
      - id: b2d028ce-bce5-4413-ab97-39070613c9c7
        name: full name
        protocol: openid-connect
        protocolMapper: oidc-full-name-mapper
        consentRequired: false
        config:
          id.token.claim: 'true'
          introspection.token.claim: 'true'
          access.token.claim: 'true'
          userinfo.token.claim: 'true'
  - id: 7ad063a8-54e1-42c2-b76d-b69911c3800c
    name: acr
    description: OpenID Connect scope for add acr (authentication context class reference)
      to the token
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'false'
      display.on.consent.screen: 'false'
    protocolMappers:
      - id: 0d28cf52-e188-4cae-9711-991987c69ed7
        name: acr loa level
        protocol: openid-connect
        protocolMapper: oidc-acr-mapper
        consentRequired: false
        config:
          id.token.claim: 'true'
          introspection.token.claim: 'true'
          access.token.claim: 'true'
          userinfo.token.claim: 'true'
  - id: 86fd6772-84f3-44f3-80db-daa75b8191a4
    name: email
    description: 'OpenID Connect built-in scope: email'
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'true'
      consent.screen.text: "${emailScopeConsentText}"
      display.on.consent.screen: 'true'
    protocolMappers:
      - id: 0bbaeda7-cbd3-4ae8-99f0-3df9d84d96d6
        name: email verified
        protocol: openid-connect
        protocolMapper: oidc-usermodel-property-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: emailVerified
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: email_verified
          jsonType.label: boolean
      - id: eaf9328e-b846-41b7-973a-d984d537fa04
        name: email
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: email
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: email
          jsonType.label: String
  - id: 37bf059e-6bb1-4ab5-aac0-9e039af9a1cf
    name: phone
    description: 'OpenID Connect built-in scope: phone'
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'true'
      consent.screen.text: "${phoneScopeConsentText}"
      display.on.consent.screen: 'true'
    protocolMappers:
      - id: 5d69d979-de3b-40ab-89d3-3580a9b2a92d
        name: phone number verified
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: phoneNumberVerified
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: phone_number_verified
          jsonType.label: boolean
      - id: f5578ce9-601c-467f-a534-b88414f2d066
        name: phone number
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: phoneNumber
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: phone_number
          jsonType.label: String
  - id: b477f7e3-88a7-4b79-980e-e84e5482eae0
    name: BPN
    description: Business Partner Number
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'true'
      display.on.consent.screen: 'false'
      gui.order: ''
      consent.screen.text: ''
    protocolMappers:
      - id: d228f0e8-2b48-483d-9eb1-302075c890aa
        name: BPN
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: BPN
          id.token.claim: 'false'
          lightweight.claim: 'false'
          access.token.claim: 'true'
          claim.name: bpn
          jsonType.label: String
  - id: b3d61b85-e6f2-4b2a-b1df-a8321eb9fc80
    name: microprofile-jwt
    description: Microprofile - JWT built-in scope
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'true'
      display.on.consent.screen: 'false'
    protocolMappers:
      - id: 90bca7a2-58ad-47c4-b9d2-7aec0aa4ef27
        name: groups
        protocol: openid-connect
        protocolMapper: oidc-usermodel-realm-role-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          multivalued: 'true'
          userinfo.token.claim: 'true'
          user.attribute: foo
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: groups
          jsonType.label: String
      - id: 41dfac47-a888-417d-a2ef-1212a79f2eb2
        name: upn
        protocol: openid-connect
        protocolMapper: oidc-usermodel-attribute-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          userinfo.token.claim: 'true'
          user.attribute: username
          id.token.claim: 'true'
          access.token.claim: 'true'
          claim.name: upn
          jsonType.label: String
  - id: 0e2fd5de-5776-4b09-ae58-438e5321f230
    name: address
    description: 'OpenID Connect built-in scope: address'
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'true'
      consent.screen.text: "${addressScopeConsentText}"
      display.on.consent.screen: 'true'
    protocolMappers:
      - id: a65631f0-05fc-46d6-ab79-4b55274125da
        name: address
        protocol: openid-connect
        protocolMapper: oidc-address-mapper
        consentRequired: false
        config:
          user.attribute.formatted: formatted
          user.attribute.country: country
          introspection.token.claim: 'true'
          user.attribute.postal_code: postal_code
          userinfo.token.claim: 'true'
          user.attribute.street: street
          id.token.claim: 'true'
          user.attribute.region: region
          access.token.claim: 'true'
          user.attribute.locality: locality
  - id: 31df86eb-085d-4330-8fd8-40706ea28f5f
    name: role_list
    description: SAML role list
    protocol: saml
    attributes:
      consent.screen.text: "${samlRoleListScopeConsentText}"
      display.on.consent.screen: 'true'
    protocolMappers:
      - id: 38a536f8-dbca-41f9-b8c6-a27781fc9d7d
        name: role list
        protocol: saml
        protocolMapper: saml-role-list-mapper
        consentRequired: false
        config:
          single: 'false'
          attribute.nameformat: Basic
          attribute.name: Role
  - id: fe548f36-36ed-498c-a161-ad5745a9a605
    name: web-origins
    description: OpenID Connect scope for add allowed web origins to the access token
    protocol: openid-connect
    attributes:
      include.in.token.scope: 'false'
      consent.screen.text: ''
      display.on.consent.screen: 'false'
    protocolMappers:
      - id: e15e64da-8b0a-40e4-a84c-bcfe49c9789b
        name: allowed web origins
        protocol: openid-connect
        protocolMapper: oidc-allowed-origins-mapper
        consentRequired: false
        config:
          introspection.token.claim: 'true'
          access.token.claim: 'true'
  - id: 146c725e-d300-42a0-9e74-c859cb02eaa6
    name: offline_access
    description: 'OpenID Connect built-in scope: offline_access'
    protocol: openid-connect
    attributes:
      consent.screen.text: "${offlineAccessScopeConsentText}"
      display.on.consent.screen: 'true'
defaultDefaultClientScopes:
  - role_list
  - profile
  - email
  - roles
  - web-origins
  - acr
  - BPN
defaultOptionalClientScopes:
  - offline_access
  - address
  - phone
  - microprofile-jwt
browserSecurityHeaders:
  contentSecurityPolicyReportOnly: ''
  xContentTypeOptions: nosniff
  referrerPolicy: no-referrer
  xRobotsTag: none
  xFrameOptions: SAMEORIGIN
  contentSecurityPolicy: frame-src 'self'; frame-ancestors 'self'; object-src 'none';
  xXSSProtection: 1; mode=block
  strictTransportSecurity: max-age=31536000; includeSubDomains
smtpServer: {}
eventsEnabled: false
eventsListeners:
  - jboss-logging
enabledEventTypes: []
adminEventsEnabled: false
adminEventsDetailsEnabled: false
identityProviders: []
identityProviderMappers: []
components:
  org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy:
    - id: 624be054-d830-4e03-a4fb-39cf2219ae72
      name: Consent Required
      providerId: consent-required
      subType: anonymous
      subComponents: {}
      config: {}
    - id: db181556-d382-4ee4-aba8-2dba06fa5de7
      name: Full Scope Disabled
      providerId: scope
      subType: anonymous
      subComponents: {}
      config: {}
    - id: 5e568798-814a-438c-a51c-10fd025db5a1
      name: Max Clients Limit
      providerId: max-clients
      subType: anonymous
      subComponents: {}
      config:
        max-clients:
          - '200'
    - id: b34e491a-2671-4438-a7cb-394c40c5acb3
      name: Allowed Client Scopes
      providerId: allowed-client-templates
      subType: authenticated
      subComponents: {}
      config:
        allow-default-scopes:
          - 'true'
    - id: 8fe2d7a7-531d-405e-83a7-c5e67858521a
      name: Allowed Client Scopes
      providerId: allowed-client-templates
      subType: anonymous
      subComponents: {}
      config:
        allow-default-scopes:
          - 'true'
    - id: 6f41e23a-d66f-4ff8-a98a-c2eeb1434432
      name: Trusted Hosts
      providerId: trusted-hosts
      subType: anonymous
      subComponents: {}
      config:
        host-sending-registration-request-must-match:
          - 'true'
        client-uris-must-match:
          - 'true'
    - id: b148c8e0-0ef6-4cfb-ac4c-ae52bbbaa8f7
      name: Allowed Protocol Mapper Types
      providerId: allowed-protocol-mappers
      subType: anonymous
      subComponents: {}
      config:
        allowed-protocol-mapper-types:
          - oidc-sha256-pairwise-sub-mapper
          - saml-user-attribute-mapper
          - oidc-usermodel-property-mapper
          - saml-role-list-mapper
          - oidc-full-name-mapper
          - oidc-address-mapper
          - oidc-usermodel-attribute-mapper
          - saml-user-property-mapper
    - id: 77de43dc-b83e-480f-ae06-a4161a5f5b43
      name: Allowed Protocol Mapper Types
      providerId: allowed-protocol-mappers
      subType: authenticated
      subComponents: {}
      config:
        allowed-protocol-mapper-types:
          - oidc-sha256-pairwise-sub-mapper
          - saml-user-attribute-mapper
          - oidc-usermodel-attribute-mapper
          - oidc-full-name-mapper
          - saml-role-list-mapper
          - oidc-usermodel-property-mapper
          - oidc-address-mapper
          - saml-user-property-mapper
  org.keycloak.keys.KeyProvider:
    - id: 3b650959-0d66-40fc-8d1b-1d093b7aeb63
      name: hmac-generated-hs512
      providerId: hmac-generated
      subComponents: {}
      config:
        kid:
          - c10c1c19-7399-49ba-ae18-ea5a49dd6544
        priority:
          - '100'
        algorithm:
          - HS512
    - id: 94bfc138-7f95-4f68-bb16-fcca8d4458b4
      name: aes-generated
      providerId: aes-generated
      subComponents: {}
      config:
        kid:
          - 236eef80-4ff3-40d4-aaee-9eb3fa547914
        priority:
          - '100'
    - id: c28812e1-ef7e-49aa-889e-64ce9b5f7963
      name: rsa-enc-generated
      providerId: rsa-enc-generated
      subComponents: {}
      config:
        privateKey:
          - MIIEpAIBAAKCAQEAuO9TDZliLXa0PWpfqO4jwre7XrvlNwm3fNO5nEfyF3TromzPioouCiYntwyUsRKx671iDRnMusyrSa60lPqbmn+nFeW3p7UqIIsk68lG0FX6/SIZJ4AY8efN4r7BKl7JXukryElZd+QQ+2ftvVlcela1zfZ0Ua6AaYavfTHMyL08JcJIiDrGyCqqz/abZVEyZTlga3FWvAuGPQMHN/BAhvSls2JVMckSv63p8oNSMczwlmBeNAdpRGEJ5jpGdUwsPp+EZHc5CzEGdm7ppX1jBM6/6EsQig455YnisJyrrb3NRKh3ZhrO25sENlBCpKVABwsI2K+qgvA70lrwopM0UwIDAQABAoIBADD1euFQyAMNN+5CaQzJ7sGv7nTH/Yiyk9cCHlNXYKoBFBiuAcvFhSa+ryjwtbSjJGMqgfjB6cdSQ85/5+LA7czbGprbc+F8Pqja7W1Wnd6txIKbMlmYugHgwkrTAUR8T4dG54ZglMT+pdhIzVGhhLAGoJ7kLisprWlCdNcKBhLmQmQM7/WXAgAhga+ebHgTTvHzBAB4eY/Wvw8+ZjVbysBFHr+k1XguMPE8UVb3Sjtx1PUxqDEIecDXybfDbWhU7G4F9QImzi0+B67/8b/VsCIU3eyCclZQn7XDk686aVp98nWCryR7GAOxC5okX+TJI3+yZ6NA9jvtNOtVbxZPBkECgYEA8RLAPOAqBSDMUj2KOH7VYHTa3+UIZPMTVTTeAkZGvZCKajqnSx8PlcNdhELSlfHe+mn68lRCIntT3o4qFy6dK0154CW0Y0gh89S/IFrX2G6JffLqKZOLDSm1bBM5sMIhVEFCsowjj3G1oQi8OE+uI8MyqbJjKHzyW0AI2fOZbsMCgYEAxGK5gnTSWUKCpWZN3yFjm1OkQ73pUBg6oo6o2VTnkdWwr/dVxhiwy7KMvKIx6a82DH9XB48jo15ZiHwE5QC11rqEphpKEyv21NKAeHd7E6os0r6DiNgSxTxyBpy03LBOZ40iPYBAbOgYVQ4AubkEzIQ1R3zQRyrMjat1QifY6zECgYEAioLij1eg7RdeLjaLr1A4m1Yo2BHJU+9SAVgB4z6rsIlW7hhLPN9Y3gzFM5QNWPgCzNCNziRZZ2SC2NHIH0+6IEJAr2gakBzG3Uk0k4t+jy1btFEY99B9SY/YXINjV0sDSVzBzMK2P9nuqNrTAmvNu2CRQG1tibrYqVNOgqPzWW8CgYAmJjN5Ry5Rjp0Iel4oOTk7RD1Ft4+qMnq5d1MPnPG7H7LKDBcKe2NkvpOeVTey+IlcViRW4JSAuORVohnlToUEaIk6JyM6pDC32QiB3lv3TviUG9Q7chX7YKmZ5TkxIcKpVP5Qyig5v8ByTV0QtwNao1giQfnHyWWhI6yMpGb8EQKBgQCyhTYfUz9hFto4FHDJv1VUNOdbJ2YoQjMscPM4ERIX3xIA/YsK/SwZCFddq2Jg3B8eqeFEpH1wpquQzLQeJAxGn6dvk2FPHWKS2pMZgYKG18WkKKfbdqwizH7SmwJW/CUoTMavb0SQpaRHxdVg1wnZVXDHG8HVFnov4AVGjnRuEw==
        keyUse:
          - ENC
        certificate:
          - MIICozCCAYsCBgGOt+Ld/jANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApDWC1DZW50cmFsMB4XDTI0MDQwNzA5MjYyMloXDTM0MDQwNzA5MjgwMlowFTETMBEGA1UEAwwKQ1gtQ2VudHJhbDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALjvUw2ZYi12tD1qX6juI8K3u1675TcJt3zTuZxH8hd066Jsz4qKLgomJ7cMlLESseu9Yg0ZzLrMq0mutJT6m5p/pxXlt6e1KiCLJOvJRtBV+v0iGSeAGPHnzeK+wSpeyV7pK8hJWXfkEPtn7b1ZXHpWtc32dFGugGmGr30xzMi9PCXCSIg6xsgqqs/2m2VRMmU5YGtxVrwLhj0DBzfwQIb0pbNiVTHJEr+t6fKDUjHM8JZgXjQHaURhCeY6RnVMLD6fhGR3OQsxBnZu6aV9YwTOv+hLEIoOOeWJ4rCcq629zUSod2YaztubBDZQQqSlQAcLCNivqoLwO9Ja8KKTNFMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAd8Z6DhRgUCTz3fgiIT6iOCkLOgOSrKSac+SmRR3DE2Y3m2pm2oZOmZqua0fA+G1UCpJcV6xRUqB4Tm6U1yr1YOV+DX6mofYuUtH9tiDG3wVah9C37VlyBPddueacppV4cpsMa1ztIhYT7GPquc7A+pXyDjZafwUD9FtkcuaeBZ27A+VgI44ZhpesBo2qVUHEfsXLs19T39OH/MJBiEFRn4/e1Gv6RTBNw1/pwtHc1FbXEzoUhzaFtN1vW0/+KvJZfzKQlachWt8TfwifZHmLS7UvCncpYfnyUFaqN7kpPRoiVyWA9rxm5+TlqhEfNcikQu738md67moXZD3MYiggiw==
        priority:
          - '100'
        algorithm:
          - RSA-OAEP
    - id: 66c954a6-3d3e-4086-b484-4cc27d118449
      name: rsa-generated
      providerId: rsa-generated
      subComponents: {}
      config:
        privateKey:
          - MIIEpAIBAAKCAQEAqFSYjzevzHvv3WVZQ1uy6GgbftTqRGiDvvP3C4tnBp21tNXJp1XT3u/WzZw43fu9Sv2/xtJTiFr3eyHrcRB5s8NplKzkjDa5oLey4yf3DEArbAIARN33RPVyW8z4QQMvkQAX47GNk6AuwQRsqcnapAxu0s1I/oeI5Lf4xw19cW18GexPKTxL6yn3KFLVzowzh5R1/uopIgocAG0MT/WzF7TZvmKt+1jDNYCu1tnIMfRm9/uQIdUkL7elfhjhYNw7UpSz7noGICWFE4UyEbX0YX+fAhJp+eZigXAnvVRnznO9/XIdOBGH5ru/Uf044St+XSDTQzM72Ot3v7pMUQZy1wIDAQABAoIBABN7CtbUQn+fPkC4iG6Pr7JOzhPNDzmQgOK5+Da5UNiGqu89KKO5fpYX2pub/0bNafhCSo33bFxk7qws3kMM/ZCsxkzC/4YslSoA6G56gxBDYuMSjjZqG8I6x5vRKk/XzwrwYFNlCnXxvUdwPCUgK7H9kFvMDy0JwXF6yws6R/C242AkOHqFfjjdlCn0vkVK2bRgchbJFn6HjkPJSa2mGq35Vd0gitwrv5ZBxvODgcp59IF6kD7lGjil9NAaSa0AXgmdQ+5vGrvuxdlmokI4VTq9jFnO6HhDen2SRV2kQ+AFNQw0yCImvqmEvnSoepV5TpqmWfuknL7vTtShm+2fZ0kCgYEA2mSPaE81KArCAgGhxR7lvnNP4wZ6vpVy3awsn4vwufseGr758Pa6q2xCoaRiDY4HkcIqoVb1YAj2WwZHM6XIs8gs37O5T+cEmkcTlER1mFsNtl1ztOmiD5QzfJ1lRckbccvsqsKYl3PEA0SfRcdOIK5mc/ZK/QQQ7GkX+/1CvM8CgYEAxVEhReANw69nQ8LE1jmCreC9H9BqPherJdi7CLT5EGYNRoAlfF+t+12ovOfbpQn4G2KSAnAq+yBrnC6jmKi65IOYGCaZ2ztsbhvmKQm72MHQzWjAC8Cg2W5REwUC+qe6YbbEZuaVP1rWYy8JsZ8owDE4A3VkCdq95VfM8R5wu3kCgYEAyek1CPxKKfYgPlih5qxVPkpALqX7754eb8HSE8P+0QPRZmrwjA6gsQJLbESdfui0KNd6MGZEQACpO6jHRYHd2BGXI093Yd81SymxeV/91NlCCTvHURi8A2lCXNDsI6P2IrSl345AI64dJ+RW2N2WZvK2uDmaROhweRIE4a3Z+NMCgYBWJ/6nTBW2hDhK1hiskaAF3EO4SICbbCpG9EN2oc6+4lCZoAq+K+kEAPlUwsidX6T+ECRA/ElILffO0m6MkeBJN0yJ/xDfMSs/SN9Ou/lRxA8wIbT5bLrPNeQgseeDGwm+8NcBN12jtD44QKmy7RQWF2el2vQ7eU/BfHz4K5p9wQKBgQDSO4Ws7ztMPmMfdgd1YP2Lkpgtpe47MZZHakpEO2qXVcRkbz7W9/XkTv8e5uUGnrDBx6F5U1nM49CqzYwxB1n1qxt9UsBjTkWqHmFNp+x10whrf/xClmNByKfbKU49SdyEOlht4wGo2+dpVYP36hla/1mBScca7fCrjWoxLniE3A==
        keyUse:
          - SIG
        certificate:
          - MIICozCCAYsCBgGOt+LdojANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApDWC1DZW50cmFsMB4XDTI0MDQwNzA5MjYyMloXDTM0MDQwNzA5MjgwMlowFTETMBEGA1UEAwwKQ1gtQ2VudHJhbDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKhUmI83r8x7791lWUNbsuhoG37U6kRog77z9wuLZwadtbTVyadV097v1s2cON37vUr9v8bSU4ha93sh63EQebPDaZSs5Iw2uaC3suMn9wxAK2wCAETd90T1clvM+EEDL5EAF+OxjZOgLsEEbKnJ2qQMbtLNSP6HiOS3+McNfXFtfBnsTyk8S+sp9yhS1c6MM4eUdf7qKSIKHABtDE/1sxe02b5irftYwzWArtbZyDH0Zvf7kCHVJC+3pX4Y4WDcO1KUs+56BiAlhROFMhG19GF/nwISafnmYoFwJ71UZ85zvf1yHTgRh+a7v1H9OOErfl0g00MzO9jrd7+6TFEGctcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEASFoDIoa0gu+N+wChzM24Eh0JDXo4aLTxHtQSJOOXCvx3IqTTclGZBEGiu3nksL5SqVURxn09pi2hyoqnw3+pM0fiUxZaDfiDzPny6wszl6YlmPzn1b03rwSBtwe5Bzuc5MFvD3y+A0tXpG3aUohE28S5xXd28gc28IISyyvuvtqDu00TejJ5t9R70YWXf5k5+LDQPFSpN6XCUR1kuSrNeBk9WrV6clrEAICyAsGxBOlBi57mGaXWKczvzjPCchluxyVn+td4AP1ycZYgbBx190YiaXXMeVKGzAMxclfJoYV94u4Yw59BA5/ZuPgt0alhVwp7XC0YoBD5agojfXHxtg==
        priority:
          - '100'
internationalizationEnabled: false
supportedLocales: []
authenticationFlows:
  - id: e9e972af-5764-4082-8916-6c89aadef66a
    alias: Account verification options
    description: Method with which to verity the existing account
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: idp-email-verification
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: ALTERNATIVE
        priority: 20
        autheticatorFlow: true
        flowAlias: Verify Existing Account by Re-authentication
        userSetupAllowed: false
  - id: 02621b08-e806-4cfd-be1b-bf0c22e904b9
    alias: Browser - Conditional OTP
    description: Flow to determine if the OTP is required for the authentication
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: conditional-user-configured
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: auth-otp-form
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
  - id: 7c25627c-d79b-410c-b0ac-7b6d05dee460
    alias: Direct Grant - Conditional OTP
    description: Flow to determine if the OTP is required for the authentication
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: conditional-user-configured
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: direct-grant-validate-otp
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
  - id: 67026c56-a76d-4753-8bc4-6b8dd179a488
    alias: First broker login - Conditional OTP
    description: Flow to determine if the OTP is required for the authentication
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: conditional-user-configured
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: auth-otp-form
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
  - id: 80001564-3457-437c-a330-33d74592ba08
    alias: Handle Existing Account
    description: Handle what to do if there is existing account with same email/username
      like authenticated identity provider
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: idp-confirm-link
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: true
        flowAlias: Account verification options
        userSetupAllowed: false
  - id: 4738ff71-d37e-47d9-bf45-e9fb3d4abf13
    alias: Reset - Conditional OTP
    description: Flow to determine if the OTP should be reset or not. Set to REQUIRED
      to force.
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: conditional-user-configured
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: reset-otp
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
  - id: 1716f1d8-7b3d-4aa4-9add-365d2ff91b27
    alias: User creation or linking
    description: Flow for the existing/non-existing user alternatives
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticatorConfig: create unique user config
        authenticator: idp-create-user-if-unique
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: ALTERNATIVE
        priority: 20
        autheticatorFlow: true
        flowAlias: Handle Existing Account
        userSetupAllowed: false
  - id: fc9059ef-eeb6-4d25-9951-4a2540a88077
    alias: Verify Existing Account by Re-authentication
    description: Reauthentication of existing account
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: idp-username-password-form
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: CONDITIONAL
        priority: 20
        autheticatorFlow: true
        flowAlias: First broker login - Conditional OTP
        userSetupAllowed: false
  - id: 18b72888-4d8b-4a84-b0b9-d525b4d69937
    alias: browser
    description: browser based authentication
    providerId: basic-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticator: auth-cookie
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: auth-spnego
        authenticatorFlow: false
        requirement: DISABLED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: identity-provider-redirector
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 25
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: ALTERNATIVE
        priority: 30
        autheticatorFlow: true
        flowAlias: forms
        userSetupAllowed: false
  - id: 828ebe00-5d3b-49d6-af20-09d54b69fb0c
    alias: clients
    description: Base authentication for clients
    providerId: client-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticator: client-secret
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: client-jwt
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: client-secret-jwt
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 30
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: client-x509
        authenticatorFlow: false
        requirement: ALTERNATIVE
        priority: 40
        autheticatorFlow: false
        userSetupAllowed: false
  - id: 6df62a81-863c-4478-8bef-779deb5ebb4e
    alias: direct grant
    description: OpenID Connect Resource Owner Grant
    providerId: basic-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticator: direct-grant-validate-username
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: direct-grant-validate-password
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: CONDITIONAL
        priority: 30
        autheticatorFlow: true
        flowAlias: Direct Grant - Conditional OTP
        userSetupAllowed: false
  - id: 02bc1f7a-6756-4b33-b5ed-3024375b1666
    alias: docker auth
    description: Used by Docker clients to authenticate against the IDP
    providerId: basic-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticator: docker-http-basic-authenticator
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
  - id: 32e30e36-6800-4eaa-97ab-34003f2b7bc8
    alias: first broker login
    description: Actions taken after first broker login with identity provider account,
      which is not yet linked to any Keycloak account
    providerId: basic-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticatorConfig: review profile config
        authenticator: idp-review-profile
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: true
        flowAlias: User creation or linking
        userSetupAllowed: false
  - id: a8c43333-7d0a-42e4-a1de-1af32514b48a
    alias: forms
    description: Username, password, otp and other auth forms.
    providerId: basic-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: auth-username-password-form
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: CONDITIONAL
        priority: 20
        autheticatorFlow: true
        flowAlias: Browser - Conditional OTP
        userSetupAllowed: false
  - id: 481504c5-1116-4c61-852d-f4ffeb32845c
    alias: registration
    description: registration flow
    providerId: basic-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticator: registration-page-form
        authenticatorFlow: true
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: true
        flowAlias: registration form
        userSetupAllowed: false
  - id: af3730c9-6d1e-428d-8e6f-34360643203a
    alias: registration form
    description: registration form
    providerId: form-flow
    topLevel: false
    builtIn: true
    authenticationExecutions:
      - authenticator: registration-user-creation
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: registration-password-action
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 50
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: registration-recaptcha-action
        authenticatorFlow: false
        requirement: DISABLED
        priority: 60
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: registration-terms-and-conditions
        authenticatorFlow: false
        requirement: DISABLED
        priority: 70
        autheticatorFlow: false
        userSetupAllowed: false
  - id: d502e2d8-aebc-4f8f-ac96-48462f96bfbe
    alias: reset credentials
    description: Reset credentials for a user if they forgot their password or something
    providerId: basic-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticator: reset-credentials-choose-user
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: reset-credential-email
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 20
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticator: reset-password
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 30
        autheticatorFlow: false
        userSetupAllowed: false
      - authenticatorFlow: true
        requirement: CONDITIONAL
        priority: 40
        autheticatorFlow: true
        flowAlias: Reset - Conditional OTP
        userSetupAllowed: false
  - id: 4877d334-857e-4d47-998a-d8c57092b42f
    alias: saml ecp
    description: SAML ECP Profile Authentication Flow
    providerId: basic-flow
    topLevel: true
    builtIn: true
    authenticationExecutions:
      - authenticator: http-basic-authenticator
        authenticatorFlow: false
        requirement: REQUIRED
        priority: 10
        autheticatorFlow: false
        userSetupAllowed: false
authenticatorConfig:
  - id: 2821e669-a48c-4d87-8a04-a4751c0d75dc
    alias: create unique user config
    config:
      require.password.update.after.registration: 'false'
  - id: e26cd3b9-6b99-4cbd-b459-640f9a80abf7
    alias: review profile config
    config:
      update.profile.on.first.login: missing
requiredActions:
  - alias: CONFIGURE_TOTP
    name: Configure OTP
    providerId: CONFIGURE_TOTP
    enabled: true
    defaultAction: false
    priority: 10
    config: {}
  - alias: TERMS_AND_CONDITIONS
    name: Terms and Conditions
    providerId: TERMS_AND_CONDITIONS
    enabled: false
    defaultAction: false
    priority: 20
    config: {}
  - alias: UPDATE_PASSWORD
    name: Update Password
    providerId: UPDATE_PASSWORD
    enabled: true
    defaultAction: false
    priority: 30
    config: {}
  - alias: UPDATE_PROFILE
    name: Update Profile
    providerId: UPDATE_PROFILE
    enabled: true
    defaultAction: false
    priority: 40
    config: {}
  - alias: VERIFY_EMAIL
    name: Verify Email
    providerId: VERIFY_EMAIL
    enabled: true
    defaultAction: false
    priority: 50
    config: {}
  - alias: delete_account
    name: Delete Account
    providerId: delete_account
    enabled: false
    defaultAction: false
    priority: 60
    config: {}
  - alias: webauthn-register
    name: Webauthn Register
    providerId: webauthn-register
    enabled: true
    defaultAction: false
    priority: 70
    config: {}
  - alias: webauthn-register-passwordless
    name: Webauthn Register Passwordless
    providerId: webauthn-register-passwordless
    enabled: true
    defaultAction: false
    priority: 80
    config: {}
  - alias: VERIFY_PROFILE
    name: Verify Profile
    providerId: VERIFY_PROFILE
    enabled: true
    defaultAction: false
    priority: 90
    config: {}
  - alias: update_user_locale
    name: Update User Locale
    providerId: update_user_locale
    enabled: true
    defaultAction: false
    priority: 1000
    config: {}
browserFlow: browser
registrationFlow: registration
directGrantFlow: direct grant
resetCredentialsFlow: reset credentials
clientAuthenticationFlow: clients
dockerAuthenticationFlow: docker auth
attributes:
  cibaBackchannelTokenDeliveryMode: poll
  cibaExpiresIn: '120'
  cibaAuthRequestedUserHint: login_hint
  oauth2DeviceCodeLifespan: '600'
  clientOfflineSessionMaxLifespan: '0'
  oauth2DevicePollingInterval: '5'
  clientSessionIdleTimeout: '0'
  parRequestUriLifespan: '60'
  clientSessionMaxLifespan: '0'
  clientOfflineSessionIdleTimeout: '0'
  cibaInterval: '5'
  realmReusableOtpCode: 'false'
keycloakVersion: 22.0.5
userManagedAccessAllowed: false
clientProfiles:
  profiles: []
clientPolicies:
  policies: []

{{- end -}}
