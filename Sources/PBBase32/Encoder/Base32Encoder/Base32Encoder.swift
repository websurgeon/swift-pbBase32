//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public struct Base32Encoder {
    let alphabet: Alphabet

    internal init(alphabet: Alphabet) {
        self.alphabet = alphabet
    }
    
    public static func base32Encoder() -> Base32Encoder {
        return Base32Encoder(alphabet: Alphabet.base32())
    }
    
}

