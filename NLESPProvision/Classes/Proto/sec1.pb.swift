// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: sec1.proto
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

enum Espressif_Sec1MsgType: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case sessionCommand0 // = 0
    case sessionResponse0 // = 1
    case sessionCommand1 // = 2
    case sessionResponse1 // = 3
    case UNRECOGNIZED(Int)

    init() {
        self = .sessionCommand0
    }

    init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .sessionCommand0
        case 1: self = .sessionResponse0
        case 2: self = .sessionCommand1
        case 3: self = .sessionResponse1
        default: self = .UNRECOGNIZED(rawValue)
        }
    }

    var rawValue: Int {
        switch self {
        case .sessionCommand0: return 0
        case .sessionResponse0: return 1
        case .sessionCommand1: return 2
        case .sessionResponse1: return 3
        case let .UNRECOGNIZED(i): return i
        }
    }
}

#if swift(>=4.2)

extension Espressif_Sec1MsgType: CaseIterable {
    // The compiler won't synthesize support with the UNRECOGNIZED case.
    static var allCases: [Espressif_Sec1MsgType] = [
        .sessionCommand0,
        .sessionResponse0,
        .sessionCommand1,
        .sessionResponse1,
    ]
}

#endif // swift(>=4.2)

struct Espressif_SessionCmd1 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var clientVerifyData: Data = SwiftProtobuf.Internal.emptyData

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_SessionResp1 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Espressif_Status = .success

    var deviceVerifyData: Data = SwiftProtobuf.Internal.emptyData

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_SessionCmd0 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var clientPubkey: Data = SwiftProtobuf.Internal.emptyData

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_SessionResp0 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Espressif_Status = .success

    var devicePubkey: Data = SwiftProtobuf.Internal.emptyData

    var deviceRandom: Data = SwiftProtobuf.Internal.emptyData

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

struct Espressif_Sec1Payload {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var msg: Espressif_Sec1MsgType {
        get { return _storage._msg }
        set { _uniqueStorage()._msg = newValue }
    }

    var payload: OneOf_Payload? {
        get { return _storage._payload }
        set { _uniqueStorage()._payload = newValue }
    }

    var sc0: Espressif_SessionCmd0 {
        get {
            if case let .sc0(v)? = _storage._payload { return v }
            return Espressif_SessionCmd0()
        }
        set { _uniqueStorage()._payload = .sc0(newValue) }
    }

    var sr0: Espressif_SessionResp0 {
        get {
            if case let .sr0(v)? = _storage._payload { return v }
            return Espressif_SessionResp0()
        }
        set { _uniqueStorage()._payload = .sr0(newValue) }
    }

    var sc1: Espressif_SessionCmd1 {
        get {
            if case let .sc1(v)? = _storage._payload { return v }
            return Espressif_SessionCmd1()
        }
        set { _uniqueStorage()._payload = .sc1(newValue) }
    }

    var sr1: Espressif_SessionResp1 {
        get {
            if case let .sr1(v)? = _storage._payload { return v }
            return Espressif_SessionResp1()
        }
        set { _uniqueStorage()._payload = .sr1(newValue) }
    }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum OneOf_Payload: Equatable {
        case sc0(Espressif_SessionCmd0)
        case sr0(Espressif_SessionResp0)
        case sc1(Espressif_SessionCmd1)
        case sr1(Espressif_SessionResp1)

        #if !swift(>=4.1)
        static func == (lhs: Espressif_Sec1Payload.OneOf_Payload, rhs: Espressif_Sec1Payload.OneOf_Payload) -> Bool {
            switch (lhs, rhs) {
            case let (.sc0(l), .sc0(r)): return l == r
            case let (.sr0(l), .sr0(r)): return l == r
            case let (.sc1(l), .sc1(r)): return l == r
            case let (.sr1(l), .sr1(r)): return l == r
            default: return false
            }
        }
        #endif
    }

    init() {}

    private var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "espressif"

extension Espressif_Sec1MsgType: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "Session_Command0"),
        1: .same(proto: "Session_Response0"),
        2: .same(proto: "Session_Command1"),
        3: .same(proto: "Session_Response1"),
    ]
}

extension Espressif_SessionCmd1: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".SessionCmd1"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        2: .standard(proto: "client_verify_data"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 2: try decoder.decodeSingularBytesField(value: &clientVerifyData)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !clientVerifyData.isEmpty {
            try visitor.visitSingularBytesField(value: clientVerifyData, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_SessionCmd1, rhs: Espressif_SessionCmd1) -> Bool {
        if lhs.clientVerifyData != rhs.clientVerifyData { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_SessionResp1: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".SessionResp1"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "status"),
        3: .standard(proto: "device_verify_data"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularEnumField(value: &status)
            case 3: try decoder.decodeSingularBytesField(value: &deviceVerifyData)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if status != .success {
            try visitor.visitSingularEnumField(value: status, fieldNumber: 1)
        }
        if !deviceVerifyData.isEmpty {
            try visitor.visitSingularBytesField(value: deviceVerifyData, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_SessionResp1, rhs: Espressif_SessionResp1) -> Bool {
        if lhs.status != rhs.status { return false }
        if lhs.deviceVerifyData != rhs.deviceVerifyData { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_SessionCmd0: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".SessionCmd0"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "client_pubkey"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularBytesField(value: &clientPubkey)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !clientPubkey.isEmpty {
            try visitor.visitSingularBytesField(value: clientPubkey, fieldNumber: 1)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_SessionCmd0, rhs: Espressif_SessionCmd0) -> Bool {
        if lhs.clientPubkey != rhs.clientPubkey { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_SessionResp0: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".SessionResp0"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "status"),
        2: .standard(proto: "device_pubkey"),
        3: .standard(proto: "device_random"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            switch fieldNumber {
            case 1: try decoder.decodeSingularEnumField(value: &status)
            case 2: try decoder.decodeSingularBytesField(value: &devicePubkey)
            case 3: try decoder.decodeSingularBytesField(value: &deviceRandom)
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if status != .success {
            try visitor.visitSingularEnumField(value: status, fieldNumber: 1)
        }
        if !devicePubkey.isEmpty {
            try visitor.visitSingularBytesField(value: devicePubkey, fieldNumber: 2)
        }
        if !deviceRandom.isEmpty {
            try visitor.visitSingularBytesField(value: deviceRandom, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_SessionResp0, rhs: Espressif_SessionResp0) -> Bool {
        if lhs.status != rhs.status { return false }
        if lhs.devicePubkey != rhs.devicePubkey { return false }
        if lhs.deviceRandom != rhs.deviceRandom { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_Sec1Payload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".Sec1Payload"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "msg"),
        20: .same(proto: "sc0"),
        21: .same(proto: "sr0"),
        22: .same(proto: "sc1"),
        23: .same(proto: "sr1"),
    ]

    fileprivate class _StorageClass {
        var _msg: Espressif_Sec1MsgType = .sessionCommand0
        var _payload: Espressif_Sec1Payload.OneOf_Payload?

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
                case 20:
                    var v: Espressif_SessionCmd0?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .sc0(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .sc0(v) }
                case 21:
                    var v: Espressif_SessionResp0?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .sr0(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .sr0(v) }
                case 22:
                    var v: Espressif_SessionCmd1?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .sc1(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .sc1(v) }
                case 23:
                    var v: Espressif_SessionResp1?
                    if let current = _storage._payload {
                        try decoder.handleConflictingOneOf()
                        if case let .sr1(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v { _storage._payload = .sr1(v) }
                default: break
                }
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
            if _storage._msg != .sessionCommand0 {
                try visitor.visitSingularEnumField(value: _storage._msg, fieldNumber: 1)
            }
            switch _storage._payload {
            case let .sc0(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 20)
            case let .sr0(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 21)
            case let .sc1(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 22)
            case let .sr1(v)?:
                try visitor.visitSingularMessageField(value: v, fieldNumber: 23)
            case nil: break
            }
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_Sec1Payload, rhs: Espressif_Sec1Payload) -> Bool {
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
