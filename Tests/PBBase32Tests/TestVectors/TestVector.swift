//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation
import PBBase32

enum TestVectorDecodingError: Error {
    case byteConversionError(prop: TestVector.CodingKeys)
}

struct TestVector: Decodable {
    let name: String
    let decoded: [Byte]
    let encoded: [Byte]
    
    enum CodingKeys: String, CodingKey {
        case name
        case decoded
        case encoded
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        
        let decodedString = try values.decode(String.self, forKey: .decoded)
        guard let decodedBytes = decodedString.data(using: .utf8) else {
            throw TestVectorDecodingError.byteConversionError(prop: CodingKeys.decoded)
        }
        decoded = [Byte](decodedBytes)

        let encodedString = try values.decode(String.self, forKey: .encoded)
        guard let encodedBytes = encodedString.data(using: .ascii) else {
            throw TestVectorDecodingError.byteConversionError(prop: .encoded)
        }
        encoded = [Byte](encodedBytes)
    }

}

private extension String {
    var utf8Bytes: [Byte] {
        return [Byte](self.data(using: .utf8)!)
    }
    
    var asciiBytes: [Byte] {
        return [Byte](self.data(using: .utf8)!)
    }
}
