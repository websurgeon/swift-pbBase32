//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Decoder {
    
    func decodeBlock(_ block: [Byte], alphabet: Alphabet) -> [Byte] {
        var output = [Byte]()
        for (index, _) in block.enumerated() {
            switch index {
            case 1:
                output.append(
                    ((block[0] << 3) & _11111000) |
                    ((block[1] >> 2) & _00000111))
            case 3:
                output.append(
                    ((block[1] << 6) & _11000000) |
                    ((block[2] << 1) & _00111110) |
                    ((block[3] >> 4) & _00000001))
            case 4:
                output.append(
                    ((block[3] << 4) & _11110000) |
                    ((block[4] >> 1) & _00001111))
            case 6:
                output.append(
                    ((block[4] << 7) & _10000000) |
                    ((block[5] << 2) & _01111100) |
                    ((block[6] >> 3) & _00000011))
            case 7:
                output.append(
                    ((block[6] << 5) & _11100000) |
                    ((block[7]     ) & _00011111))
            default:
                continue
            }
        }
        return output
    }    
    
}

private let _00000001: Byte = Byte(1)
private let _00000011: Byte = Byte(3)
private let _00000111: Byte = Byte(7)
private let _00001111: Byte = Byte(15)
private let _00011111: Byte = Byte(31)
private let _00111110: Byte = Byte(62)
private let _01111100: Byte = Byte(124)
private let _10000000: Byte = Byte(128)
private let _11000000: Byte = Byte(192)
private let _11100000: Byte = Byte(224)
private let _11110000: Byte = Byte(240)
private let _11111000: Byte = Byte(248)

