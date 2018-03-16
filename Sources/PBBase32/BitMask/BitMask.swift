//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

enum BitMask: Byte {
    case noMask = 0x0
    case _11111 = 0x1f
    case _11100 = 0x1c
    case _00011 = 0x03
    case _10000 = 0x10
    case _01111 = 0x0f
    case _11110 = 0x1e
    case _00001 = 0x01
    case _11000 = 0x18
    case _00111 = 0x07
    
    func mask(_ byte: Byte) -> Byte {
        return byte & self.rawValue
    }
}
