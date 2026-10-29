//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift OTel open source project
//
// Copyright (c) 2024 the Swift OTel project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import Logging

struct OTelLogRecord: Equatable, Sendable {
    var body: Logger.Message
    var level: Logger.Level
    var metadata: Logger.Metadata
    var timeNanosecondsSinceEpoch: UInt64
    /// OTLP log record `event_name`. Set for session lifecycle events (e.g. `session.start`/`session.end`)
    /// that Grafana Frontend Observability keys on. Lifted from a reserved metadata key by `OTelLogHandler`.
    var eventName: String?

    let resource: OTelResource
    let spanContext: OTelSpanContext?

    init(
        body: Logger.Message,
        level: Logger.Level,
        metadata: Logger.Metadata,
        timeNanosecondsSinceEpoch: UInt64,
        resource: OTelResource,
        spanContext: OTelSpanContext?,
        eventName: String? = nil
    ) {
        self.body = body
        self.level = level
        self.metadata = metadata
        self.timeNanosecondsSinceEpoch = timeNanosecondsSinceEpoch
        self.resource = resource
        self.spanContext = spanContext
        self.eventName = eventName
    }
}
