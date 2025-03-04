// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: wifi_config.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

// Copyright 2020 Espressif Systems
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

enum Espressif_WiFiConfigMsgType: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case typeCmdGetStatus // = 0
    case typeRespGetStatus // = 1
    case typeCmdSetConfig // = 2
    case typeRespSetConfig // = 3
    case typeCmdApplyConfig // = 4
    case typeRespApplyConfig // = 5
    case UNRECOGNIZED(Int)

    init() {
        self = .typeCmdGetStatus
    }

    init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .typeCmdGetStatus
        case 1: self = .typeRespGetStatus
        case 2: self = .typeCmdSetConfig
        case 3: self = .typeRespSetConfig
        case 4: self = .typeCmdApplyConfig
        case 5: self = .typeRespApplyConfig
        default: self = .UNRECOGNIZED(rawValue)
        }
    }

    var rawValue: Int {
        switch self {
        case .typeCmdGetStatus: return 0
        case .typeRespGetStatus: return 1
        case .typeCmdSetConfig: return 2
        case .typeRespSetConfig: return 3
        case .typeCmdApplyConfig: return 4
        case .typeRespApplyConfig: return 5
        case let .UNRECOGNIZED(i): return i
        }
    }
}

#if swift(>=4.2)

extension Espressif_WiFiConfigMsgType: CaseIterable {
    // The compiler won't synthesize support with the UNRECOGNIZED case.
    static var allCases: [Espressif_WiFiConfigMsgType] = [
        .typeCmdGetStatus,
        .typeRespGetStatus,
        .typeCmdSetConfig,
        .typeRespSetConfig,
        .typeCmdApplyConfig,
        .typeRespApplyConfig,
    ]
}

#endif // swift(>=4.2)

struct Espressif_CmdGetStatus {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_RespGetStatus {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Espressif_Status {
        get { return _storage._status }
        set { _uniqueStorage()._status = newValue }
    }

    var staState: Espressif_WifiStationState {
        get { return _storage._staState }
        set { _uniqueStorage()._staState = newValue }
    }

    var state: OneOf_State? {
        get { return _storage._state }
        set { _uniqueStorage()._state = newValue }
    }

    var failReason: Espressif_WifiConnectFailedReason {
        get {
            if case let .failReason(v)? = _storage._state { return v }
            return .authError
        }
        set { _uniqueStorage()._state = .failReason(newValue) }
    }

    var connected: Espressif_WifiConnectedState {
        get {
            if case let .connected(v)? = _storage._state { return v }
            return Espressif_WifiConnectedState()
        }
        set { _uniqueStorage()._state = .connected(newValue) }
    }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum OneOf_State: Equatable {
        case failReason(Espressif_WifiConnectFailedReason)
        case connected(Espressif_WifiConnectedState)

        #if !swift(>=4.1)
        static func == (lhs: Espressif_RespGetStatus.OneOf_State, rhs: Espressif_RespGetStatus.OneOf_State) -> Bool {
            switch (lhs, rhs) {
            case let (.failReason(l), .failReason(r)): return l == r
            case let (.connected(l), .connected(r)): return l == r
            default: return false
            }
        }
        #endif
    }

    init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
}

struct Espressif_CmdSetConfig {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var ssid: Data = SwiftProtobuf.Internal.emptyData

    var passphrase: Data = SwiftProtobuf.Internal.emptyData

    var bssid: Data = SwiftProtobuf.Internal.emptyData

    var channel: Int32 = 0

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_RespSetConfig {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Espressif_Status = .success

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_CmdApplyConfig {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_RespApplyConfig {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Espressif_Status = .success

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_WiFiConfigPayload {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var msg: Espressif_WiFiConfigMsgType {
        get { return _storage._msg }
        set { _uniqueStorage()._msg = newValue }
    }

    var payload: OneOf_Payload? {
        get { return _storage._payload }
        set { _uniqueStorage()._payload = newValue }
    }

    var cmdGetStatus: Espressif_CmdGetStatus {
        get {
            if case let .cmdGetStatus(v)? = _storage._payload { return v }
            return Espressif_CmdGetStatus()
        }
        set { _uniqueStorage()._payload = .cmdGetStatus(newValue) }
    }

    var respGetStatus: Espressif_RespGetStatus {
        get {
            if case let .respGetStatus(v)? = _storage._payload { return v }
            return Espressif_RespGetStatus()
        }
        set { _uniqueStorage()._payload = .respGetStatus(newValue) }
    }

    var cmdSetConfig: Espressif_CmdSetConfig {
        get {
            if case let .cmdSetConfig(v)? = _storage._payload { return v }
            return Espressif_CmdSetConfig()
        }
        set { _uniqueStorage()._payload = .cmdSetConfig(newValue) }
    }

    var respSetConfig: Espressif_RespSetConfig {
        get {
            if case let .respSetConfig(v)? = _storage._payload { return v }
            return Espressif_RespSetConfig()
        }
        set { _uniqueStorage()._payload = .respSetConfig(newValue) }
    }

    var cmdApplyConfig: Espressif_CmdApplyConfig {
        get {
            if case let .cmdApplyConfig(v)? = _storage._payload { return v }
            return Espressif_CmdApplyConfig()
        }
        set { _uniqueStorage()._payload = .cmdApplyConfig(newValue) }
    }

    var respApplyConfig: Espressif_RespApplyConfig {
        get {
            if case let .respApplyConfig(v)? = _storage._payload { return v }
            return Espressif_RespApplyConfig()
        }
        set { _uniqueStorage()._payload = .respApplyConfig(newValue) }
    }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum OneOf_Payload: Equatable {
        case cmdGetStatus(Espressif_CmdGetStatus)
        case respGetStatus(Espressif_RespGetStatus)
        case cmdSetConfig(Espressif_CmdSetConfig)
        case respSetConfig(Espressif_RespSetConfig)
        case cmdApplyConfig(Espressif_CmdApplyConfig)
        case respApplyConfig(Espressif_RespApplyConfig)

        #if !swift(>=4.1)
        static func == (lhs: Espressif_WiFiConfigPayload.OneOf_Payload, rhs: Espressif_WiFiConfigPayload.OneOf_Payload) -> Bool {
            switch (lhs, rhs) {
            case let (.cmdGetStatus(l), .cmdGetStatus(r)): return l == r
            case let (.respGetStatus(l), .respGetStatus(r)): return l == r
            case let (.cmdSetConfig(l), .cmdSetConfig(r)): return l == r
            case let (.respSetConfig(l), .respSetConfig(r)): return l == r
            case let (.cmdApplyConfig(l), .cmdApplyConfig(r)): return l == r
            case let (.respApplyConfig(l), .respApplyConfig(r)): return l == r
            default: return false
            }
        }
        #endif
    }

    init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "espressif"

extension Espressif_WiFiConfigMsgType: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "TypeCmdGetStatus"),
        1: .same(proto: "TypeRespGetStatus"),
        2: .same(proto: "TypeCmdSetConfig"),
        3: .same(proto: "TypeRespSetConfig"),
        4: .same(proto: "TypeCmdApplyConfig"),
        5: .same(proto: "TypeRespApplyConfig"),
    ]
}

extension Espressif_CmdGetStatus: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".CmdGetStatus"
    static let _protobuf_nameMap = SwiftProtobuf._NameMap()

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let _ = try decoder.nextFieldNumber() {}
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_CmdGetStatus, rhs: Espressif_CmdGetStatus) -> Bool {
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_RespGetStatus: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".RespGetStatus"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "status"),
        2: .standard(proto: "sta_state"),
        10: .standard(proto: "fail_reason"),
        11: .same(proto: "connected"),
    ]

    fileprivate class _StorageClass {
        var _status: Espressif_Status = .success
        var _staState: Espressif_WifiStationState = .connected
        var _state: Espressif_RespGetStatus.OneOf_State?

        static let defaultInstance = _StorageClass()

        private init() {}

        init(copying source: _StorageClass) {
            _status = source._status
            _staState = source._staState
            _state = source._state
        }
    }

    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularEnumField(value: &_storage._status)
                case 2: try decoder.decodeSingularEnumField(value: &_storage._staState)
                case 10:
                    if _storage._state != nil { try decoder.handleConflictingOneOf() }
                    var v: Espressif_WifiConnectFailedReason?
                    try decoder.decodeSingularEnumField(value: &v)
                    if let v = v { _storage._state = .failReason(v) }
                case 11:
                    var v: Espressif_WifiConnectedState?
                    if let current = _storage._state {
                        try decoder.handleConflictingOneOf()
                        if case let .connected(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._state = .connected(v) }
                default: break
                }
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if _storage._status != .success {
                try visitor.visitSingularEnumField(value: _storage._status, fieldNumber: 1)
            }
            if _storage._staState != .connected {
                try visitor.visitSingularEnumField(value: _storage._staState, fieldNumber: 2)
            }
            switch _storage._state {
            case let .failReason(v)?:
                try visitor.visitSingularEnumField(value: v, fieldNumber: 10)
            case let .connected(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
            case nil: break
            }
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_RespGetStatus, rhs: Espressif_RespGetStatus) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._status != rhs_storage._status { return false }
                if _storage._staState != rhs_storage._staState { return false }
                if _storage._state != rhs_storage._state { return false }
                return true
            }
            if !storagesAreEqual { return false }
        }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_CmdSetConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".CmdSetConfig"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "ssid"),
        2: .same(proto: "passphrase"),
        3: .same(proto: "bssid"),
        4: .same(proto: "channel"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &ssid)
            case 2: try decoder.decodeSingularBytesField(value: &passphrase)
            case 3: try decoder.decodeSingularBytesField(value: &bssid)
            case 4: try decoder.decodeSingularInt32Field(value: &channel)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !ssid.isEmpty {
            try visitor.visitSingularBytesField(value: ssid, fieldNumber: 1)
        }
        if !passphrase.isEmpty {
            try visitor.visitSingularBytesField(value: passphrase, fieldNumber: 2)
        }
        if !bssid.isEmpty {
            try visitor.visitSingularBytesField(value: bssid, fieldNumber: 3)
        }
        if channel != 0 {
            try visitor.visitSingularInt32Field(value: channel, fieldNumber: 4)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_CmdSetConfig, rhs: Espressif_CmdSetConfig) -> Bool {
        if lhs.ssid != rhs.ssid { return false }
        if lhs.passphrase != rhs.passphrase { return false }
        if lhs.bssid != rhs.bssid { return false }
        if lhs.channel != rhs.channel { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_RespSetConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".RespSetConfig"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "status"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularEnumField(value: &status)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if status != .success {
            try visitor.visitSingularEnumField(value: status, fieldNumber: 1)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_RespSetConfig, rhs: Espressif_RespSetConfig) -> Bool {
        if lhs.status != rhs.status { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_CmdApplyConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".CmdApplyConfig"
    static let _protobuf_nameMap = SwiftProtobuf._NameMap()

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let _ = try decoder.nextFieldNumber() {}
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_CmdApplyConfig, rhs: Espressif_CmdApplyConfig) -> Bool {
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_RespApplyConfig: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".RespApplyConfig"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "status"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularEnumField(value: &status)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if status != .success {
            try visitor.visitSingularEnumField(value: status, fieldNumber: 1)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_RespApplyConfig, rhs: Espressif_RespApplyConfig) -> Bool {
        if lhs.status != rhs.status { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_WiFiConfigPayload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".WiFiConfigPayload"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "msg"),
        10: .standard(proto: "cmd_get_status"),
        11: .standard(proto: "resp_get_status"),
        12: .standard(proto: "cmd_set_config"),
        13: .standard(proto: "resp_set_config"),
        14: .standard(proto: "cmd_apply_config"),
        15: .standard(proto: "resp_apply_config"),
    ]

    fileprivate class _StorageClass {
        var _msg: Espressif_WiFiConfigMsgType = .typeCmdGetStatus
        var _payload: Espressif_WiFiConfigPayload.OneOf_Payload?

        static let defaultInstance = _StorageClass()

        private init() {}

        init(copying source: _StorageClass) {
            _msg = source._msg
            _payload = source._payload
        }
    }

    fileprivate mutating func _uniqueStorage() -> _StorageClass {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _StorageClass(copying: _storage)
        }
        return _storage
    }

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        _ = _uniqueStorage()
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            while let fieldNumber = try decoder.nextFieldNumber() {
                switch fieldNumber {
                case 1: try decoder.decodeSingularEnumField(value: &_storage._msg)
                case 10:
                    var v: Espressif_CmdGetStatus?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .cmdGetStatus(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .cmdGetStatus(v) }
                case 11:
                    var v: Espressif_RespGetStatus?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .respGetStatus(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .respGetStatus(v) }
                case 12:
                    var v: Espressif_CmdSetConfig?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .cmdSetConfig(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .cmdSetConfig(v) }
                case 13:
                    var v: Espressif_RespSetConfig?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .respSetConfig(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .respSetConfig(v) }
                case 14:
                    var v: Espressif_CmdApplyConfig?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .cmdApplyConfig(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .cmdApplyConfig(v) }
                case 15:
                    var v: Espressif_RespApplyConfig?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .respApplyConfig(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .respApplyConfig(v) }
                default: break
                }
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if _storage._msg != .typeCmdGetStatus {
                try visitor.visitSingularEnumField(value: _storage._msg, fieldNumber: 1)
            }
            switch _storage._payload {
            case let .cmdGetStatus(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
            case let .respGetStatus(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 11)
            case let .cmdSetConfig(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 12)
            case let .respSetConfig(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 13)
            case let .cmdApplyConfig(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 14)
            case let .respApplyConfig(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 15)
            case nil: break
            }
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_WiFiConfigPayload, rhs: Espressif_WiFiConfigPayload) -> Bool {
        if lhs._storage !== rhs._storage {
            let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
                let _storage = _args.0
                let rhs_storage = _args.1
                if _storage._msg != rhs_storage._msg { return false }
                if _storage._payload != rhs_storage._payload { return false }
                return true
            }
            if !storagesAreEqual { return false }
        }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}
