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

package org.eclipse.tractusx.bpdm.gate.config

import jakarta.annotation.PostConstruct
import org.eclipse.tractusx.bpdm.gate.service.GoldenRecordUpdateBatchService
import org.eclipse.tractusx.bpdm.gate.service.TaskCreationBatchService
import org.eclipse.tractusx.bpdm.gate.service.TaskResolutionBatchService
import org.springframework.context.annotation.Configuration
import org.springframework.scheduling.TaskScheduler
import org.springframework.scheduling.support.CronTrigger

@Configuration
class GoldenRecordTaskConfiguration(
    private val configProperties: GoldenRecordTaskConfigProperties,
    private val taskScheduler: TaskScheduler,
    private val taskCreationService: TaskCreationBatchService,
    private val taskResolutionService: TaskResolutionBatchService,
    private val updateService: GoldenRecordUpdateBatchService
) {

    @PostConstruct
    fun scheduleGoldenRecordTasks() {
        taskScheduler.scheduleIfEnabled(
            { taskCreationService.createTasksForReadyBusinessPartners() },
            configProperties.creation.fromSharingMember.cron
        )

        taskScheduler.scheduleIfEnabled(
            { updateService.updateOutputOnGoldenRecordChange() },
            configProperties.creation.fromPool.cron
        )

        taskScheduler.scheduleIfEnabled(
            { taskResolutionService.resolveTasks() },
            configProperties.check.cron
        )
    }

    private fun TaskScheduler.scheduleIfEnabled(task: Runnable, cronExpression: String) {
        if (cronExpression != "-") {
            schedule(task, CronTrigger(cronExpression))
        }
    }


}