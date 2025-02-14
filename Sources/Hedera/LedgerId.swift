/*
 * ‌
 * Hedera Swift SDK
 * ​
 * Copyright (C) 2022 - 2023 Hedera Hashgraph, LLC
 * ​
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ‍
 */

import Foundation

public struct LedgerId: Equatable, Codable, CustomStringConvertible {
    public static let mainnet = LedgerId(Data([0]))

    public static let testnet = LedgerId(Data([1]))

    public static let previewnet = LedgerId(Data([2]))

    public init(_ bytes: Data) {
        self.bytes = bytes
    }

    public init(from decoder: Decoder) throws {
        self.init(try decoder.singleValueContainer().decode(String.self))!
    }

    public init?(_ description: String) {
        let bytes = Data(base64Encoded: description)

        if (bytes == nil) {
            return nil
        }

        self.bytes = bytes!
    }

    private let bytes: Data

    public func isMainnet() -> Bool {
        self == Self.mainnet
    }

    public func isTestnet() -> Bool {
        self == Self.testnet
    }

    public func isPreviewnet() -> Bool {
        self == Self.previewnet
    }

    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.bytes == rhs.bytes
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(String(describing: self))
    }

    public var description: String {
        bytes.base64EncodedString()
    }

}
