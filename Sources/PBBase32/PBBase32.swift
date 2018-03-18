//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public typealias Byte = UInt8

public func base32Encode(data: Data) throws -> Data {
    return try Base32Encoder.base32Encoder().encode(data: data)
}

public func base32Encode(string: String) throws -> String {
    return try Base32Encoder.base32Encoder().encode(string: string)
}

public func base32Decode(data: Data) throws -> Data {
    return try Base32Decoder.base32Decoder().decode(data: data)
}

public func base32Decode(string: String) throws -> String {
    return try Base32Decoder.base32Decoder().decode(string: string)
}
