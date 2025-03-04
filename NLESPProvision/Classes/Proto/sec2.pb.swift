// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: sec2.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/
// Copyright 2022 Espressif Systems
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
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
private struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
    struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
    typealias Version = _2
}

/// A message must be of type Cmd0 / Cmd1 / Resp0 / Resp1
enum Espressif_Sec2MsgType: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case s2SessionCommand0 // = 0
    case s2SessionResponse0 // = 1
    case s2SessionCommand1 // = 2
    case s2SessionResponse1 // = 3
    case UNRECOGNIZED(Int)

    init() {
        self = .s2SessionCommand0
    }

    init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .s2SessionCommand0
        case 1: self = .s2SessionResponse0
        case 2: self = .s2SessionCommand1
        case 3: self = .s2SessionResponse1
        default: self = .UNRECOGNIZED(rawValue)
        }
    }

    var rawValue: Int {
        switch self {
        case .s2SessionCommand0: return 0
        case .s2SessionResponse0: return 1
        case .s2SessionCommand1: return 2
        case .s2SessionResponse1: return 3
        case let .UNRECOGNIZED(i): return i
        }
    }
}

#if swift(>=4.2)

extension Espressif_Sec2MsgType: CaseIterable {
    // The compiler won't synthesize support with the UNRECOGNIZED case.
    static var allCases: [Espressif_Sec2MsgType] = [
        .s2SessionCommand0,
        .s2SessionResponse0,
        .s2SessionCommand1,
        .s2SessionResponse1,
    ]
}

#endif // swift(>=4.2)

/// Data structure of Session command0 packet
struct Espressif_S2SessionCmd0 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var clientUsername: Data = .init()

    var clientPubkey: Data = .init()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

/// Data structure of Session response0 packet
struct Espressif_S2SessionResp0 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Espressif_Status = .success

    var devicePubkey: Data = .init()

    var deviceSalt: Data = .init()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

/// Data structure of Session command1 packet
struct Espressif_S2SessionCmd1 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var clientProof: Data = .init()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

/// Data structure of Session response1 packet
struct Espressif_S2SessionResp1 {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var status: Espressif_Status = .success

    var deviceProof: Data = .init()

    var deviceNonce: Data = .init()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
}

/// Payload structure of session data
struct Espressif_Sec2Payload {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// !< Type of message
    var msg: Espressif_Sec2MsgType = .s2SessionCommand0

    var payload: Espressif_Sec2Payload.OneOf_Payload?

    /// !< Payload data interpreted as Cmd0
    var sc0: Espressif_S2SessionCmd0 {
        get {
            if case let .sc0(v)? = payload { return v }
            return Espressif_S2SessionCmd0()
        }
        set { payload = .sc0(newValue) }
    }

    /// !< Payload data interpreted as Resp0
    var sr0: Espressif_S2SessionResp0 {
        get {
            if case let .sr0(v)? = payload { return v }
            return Espressif_S2SessionResp0()
        }
        set { payload = .sr0(newValue) }
    }

    /// !< Payload data interpreted as Cmd1
    var sc1: Espressif_S2SessionCmd1 {
        get {
            if case let .sc1(v)? = payload { return v }
            return Espressif_S2SessionCmd1()
        }
        set { payload = .sc1(newValue) }
    }

    /// !< Payload data interpreted as Resp1
    var sr1: Espressif_S2SessionResp1 {
        get {
            if case let .sr1(v)? = payload { return v }
            return Espressif_S2SessionResp1()
        }
        set { payload = .sr1(newValue) }
    }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    enum OneOf_Payload: Equatable {
        /// !< Payload data interpreted as Cmd0
        case sc0(Espressif_S2SessionCmd0)
        /// !< Payload data interpreted as Resp0
        case sr0(Espressif_S2SessionResp0)
        /// !< Payload data interpreted as Cmd1
        case sc1(Espressif_S2SessionCmd1)
        /// !< Payload data interpreted as Resp1
        case sr1(Espressif_S2SessionResp1)

        #if !swift(>=4.1)
        static func == (lhs: Espressif_Sec2Payload.OneOf_Payload, rhs: Espressif_Sec2Payload.OneOf_Payload) -> Bool {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch (lhs, rhs) {
            case (.sc0, .sc0): return {
                    guard case let .sc0(l) = lhs, case let .sc0(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.sr0, .sr0): return {
                    guard case let .sr0(l) = lhs, case let .sr0(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.sc1, .sc1): return {
                    guard case let .sc1(l) = lhs, case let .sc1(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            case (.sr1, .sr1): return {
                    guard case let .sr1(l) = lhs, case let .sr1(r) = rhs else { preconditionFailure() }
                    return l == r
                }()
            default: return false
            }
        }
        #endif
    }

    init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Espressif_Sec2MsgType: @unchecked Sendable {}
extension Espressif_S2SessionCmd0: @unchecked Sendable {}
extension Espressif_S2SessionResp0: @unchecked Sendable {}
extension Espressif_S2SessionCmd1: @unchecked Sendable {}
extension Espressif_S2SessionResp1: @unchecked Sendable {}
extension Espressif_Sec2Payload: @unchecked Sendable {}
extension Espressif_Sec2Payload.OneOf_Payload: @unchecked Sendable {}
#endif // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

private let _protobuf_package = "espressif"

extension Espressif_Sec2MsgType: SwiftProtobuf._ProtoNameProviding {
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        0: .same(proto: "S2Session_Command0"),
        1: .same(proto: "S2Session_Response0"),
        2: .same(proto: "S2Session_Command1"),
        3: .same(proto: "S2Session_Response1"),
    ]
}

extension Espressif_S2SessionCmd0: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".S2SessionCmd0"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "client_username"),
        2: .standard(proto: "client_pubkey"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeSingularBytesField(value: &self.clientUsername) }()
            case 2: try { try decoder.decodeSingularBytesField(value: &self.clientPubkey) }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !clientUsername.isEmpty {
            try visitor.visitSingularBytesField(value: clientUsername, fieldNumber: 1)
        }
        if !clientPubkey.isEmpty {
            try visitor.visitSingularBytesField(value: clientPubkey, fieldNumber: 2)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_S2SessionCmd0, rhs: Espressif_S2SessionCmd0) -> Bool {
        if lhs.clientUsername != rhs.clientUsername { return false }
        if lhs.clientPubkey != rhs.clientPubkey { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_S2SessionResp0: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".S2SessionResp0"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "status"),
        2: .standard(proto: "device_pubkey"),
        3: .standard(proto: "device_salt"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeSingularEnumField(value: &self.status) }()
            case 2: try { try decoder.decodeSingularBytesField(value: &self.devicePubkey) }()
            case 3: try { try decoder.decodeSingularBytesField(value: &self.deviceSalt) }()
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
        if !deviceSalt.isEmpty {
            try visitor.visitSingularBytesField(value: deviceSalt, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_S2SessionResp0, rhs: Espressif_S2SessionResp0) -> Bool {
        if lhs.status != rhs.status { return false }
        if lhs.devicePubkey != rhs.devicePubkey { return false }
        if lhs.deviceSalt != rhs.deviceSalt { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_S2SessionCmd1: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".S2SessionCmd1"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .standard(proto: "client_proof"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeSingularBytesField(value: &self.clientProof) }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if !clientProof.isEmpty {
            try visitor.visitSingularBytesField(value: clientProof, fieldNumber: 1)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_S2SessionCmd1, rhs: Espressif_S2SessionCmd1) -> Bool {
        if lhs.clientProof != rhs.clientProof { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_S2SessionResp1: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".S2SessionResp1"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "status"),
        2: .standard(proto: "device_proof"),
        3: .standard(proto: "device_nonce"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeSingularEnumField(value: &self.status) }()
            case 2: try { try decoder.decodeSingularBytesField(value: &self.deviceProof) }()
            case 3: try { try decoder.decodeSingularBytesField(value: &self.deviceNonce) }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        if status != .success {
            try visitor.visitSingularEnumField(value: status, fieldNumber: 1)
        }
        if !deviceProof.isEmpty {
            try visitor.visitSingularBytesField(value: deviceProof, fieldNumber: 2)
        }
        if !deviceNonce.isEmpty {
            try visitor.visitSingularBytesField(value: deviceNonce, fieldNumber: 3)
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_S2SessionResp1, rhs: Espressif_S2SessionResp1) -> Bool {
        if lhs.status != rhs.status { return false }
        if lhs.deviceProof != rhs.deviceProof { return false }
        if lhs.deviceNonce != rhs.deviceNonce { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}

extension Espressif_Sec2Payload: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
    static let protoMessageName: String = _protobuf_package + ".Sec2Payload"
    static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
        1: .same(proto: "msg"),
        20: .same(proto: "sc0"),
        21: .same(proto: "sr0"),
        22: .same(proto: "sc1"),
        23: .same(proto: "sr1"),
    ]

    mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
        while let fieldNumber = try decoder.nextFieldNumber() {
            // The use of inline closures is to circumvent an issue where the compiler
            // allocates stack space for every case branch when no optimizations are
            // enabled. https://github.com/apple/swift-protobuf/issues/1034
            switch fieldNumber {
            case 1: try { try decoder.decodeSingularEnumField(value: &self.msg) }()
            case 20: try {
                    var v: Espressif_S2SessionCmd0?
                    var hadOneofValue = false
                    if let current = self.payload {
                        hadOneofValue = true
                        if case let .sc0(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.payload = .sc0(v)
                    }
                }()
            case 21: try {
                    var v: Espressif_S2SessionResp0?
                    var hadOneofValue = false
                    if let current = self.payload {
                        hadOneofValue = true
                        if case let .sr0(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.payload = .sr0(v)
                    }
                }()
            case 22: try {
                    var v: Espressif_S2SessionCmd1?
                    var hadOneofValue = false
                    if let current = self.payload {
                        hadOneofValue = true
                        if case let .sc1(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.payload = .sc1(v)
                    }
                }()
            case 23: try {
                    var v: Espressif_S2SessionResp1?
                    var hadOneofValue = false
                    if let current = self.payload {
                        hadOneofValue = true
                        if case let .sr1(m) = current { v = m }
                    }
                    try decoder.decodeSingularMessageField(value: &v)
                    if let v = v {
                        if hadOneofValue { try decoder.handleConflictingOneOf() }
                        self.payload = .sr1(v)
                    }
                }()
            default: break
            }
        }
    }

    func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every if/case branch local when no optimizations
        // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
        // https://github.com/apple/swift-protobuf/issues/1182
        if msg != .s2SessionCommand0 {
            try visitor.visitSingularEnumField(value: msg, fieldNumber: 1)
        }
        switch payload {
        case .sc0?: try {
                guard case let .sc0(v)? = self.payload else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 20)
            }()
        case .sr0?: try {
                guard case let .sr0(v)? = self.payload else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 21)
            }()
        case .sc1?: try {
                guard case let .sc1(v)? = self.payload else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 22)
            }()
        case .sr1?: try {
                guard case let .sr1(v)? = self.payload else { preconditionFailure() }
                try visitor.visitSingularMessageField(value: v, fieldNumber: 23)
            }()
        case nil: break
        }
        try unknownFields.traverse(visitor: &visitor)
    }

    static func == (lhs: Espressif_Sec2Payload, rhs: Espressif_Sec2Payload) -> Bool {
        if lhs.msg != rhs.msg { return false }
        if lhs.payload != rhs.payload { return false }
        if lhs.unknownFields != rhs.unknownFields { return false }
        return true
    }
}
