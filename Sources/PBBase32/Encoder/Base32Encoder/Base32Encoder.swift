//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public struct Base32Encoder: ByteArrayEncoder {
    
    public static func encoder() -> Base32Encoder {
        return Base32Encoder()
    }

    func encode(bytes: [Byte]) throws -> [Byte] {
        return [Byte]()
    }

}
