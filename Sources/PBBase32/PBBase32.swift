//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

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

public func base32hexEncode(data: Data) throws -> Data {
    return try Base32Encoder.base32hexEncoder().encode(data: data)
}

public func base32hexEncode(string: String) throws -> String {
    return try Base32Encoder.base32hexEncoder().encode(string: string)
}

public func base32hexDecode(data: Data) throws -> Data {
    return try Base32Decoder.base32hexDecoder().decode(data: data)
}

public func base32hexDecode(string: String) throws -> String {
    return try Base32Decoder.base32hexDecoder().decode(string: string)
}
