//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public struct Base32Decoder {
    let alphabet: Alphabet
    
    init(alphabet: Alphabet) {
        self.alphabet = alphabet
    }
    
    public static func base32Decoder() -> Base32Decoder {
        return Base32Decoder(alphabet: Alphabet.base32())
    }

}

