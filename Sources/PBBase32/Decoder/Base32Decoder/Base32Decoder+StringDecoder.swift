//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Decoder: StringDecoder {
    
    public func decode(string: String) throws -> String {
        let data = try dataDecodedFromAscii(string: string)
        let decodedBytes = try decode(bytes: [Byte](data))
        return try stringFromDecodedBytes(decodedBytes)
    }
    
    private func dataDecodedFromAscii(string: String) throws -> Data {
        guard let data = string.data(using: .ascii) else {
            throw Base32DecoderError.notAsciiInput
        }
        return data
    }
    
    private func stringFromDecodedBytes(_ bytes: [Byte]) throws -> String {
        guard let string = String(data: Data(bytes), encoding: .utf8) else {
            throw Base32DecoderError.invalidOutput(bytes: bytes)
        }
        return string
    }
}

