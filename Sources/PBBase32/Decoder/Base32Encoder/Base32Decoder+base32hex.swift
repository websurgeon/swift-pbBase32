//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Decoder {
    public static func base32hexDecoder() -> Base32Decoder {
        return Base32Decoder(alphabet: Alphabet.base32hex())
    }
}

