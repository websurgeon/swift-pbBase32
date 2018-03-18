//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Encoder {
    public static func base32hexEncoder() -> Base32Encoder {
        return Base32Encoder(alphabet: Alphabet.base32hex())
    }
}

