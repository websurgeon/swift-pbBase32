//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public struct Base32Decoder: ByteArrayDecoder {
    private let alphabet: Alphabet
    
    public static func decoder() -> Base32Decoder {
        return Base32Decoder(alphabet: Alphabet.base32())
    }
    
    func decode(bytes: [Byte]) throws -> [Byte] {
        return [Byte](Data())
    }
    
}


