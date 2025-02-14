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

package org.eclipse.tractusx.bpdm.gate.util

import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken
import java.time.Instant
import java.time.LocalDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter

fun <T> List<T>.containsDuplicates(): Boolean = size != distinct().size

fun <K, V> Map<K, V?>.filterNotNullValues(): Map<K, V> =
    filterValues { it != null }.mapValues { it.value ?: throw IllegalStateException("This can never happen") }

fun <K, V> Map<K?, V>.filterNotNullKeys(): Map<K, V> = filterKeys { it != null }.mapKeys { it.key ?: throw IllegalStateException("This can never happen") }

fun getCurrentUserBpn(): String? {
    val authentication = SecurityContextHolder.getContext().authentication
    if (authentication is JwtAuthenticationToken) {
        return authentication.tokenAttributes["bpn"] as String? ?: null
    }
    return null;
}