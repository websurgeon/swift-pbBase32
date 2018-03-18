//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Encoder {
    
    func encodeBlock(_ block: [Byte], alphabet: Alphabet) -> [Byte] {
        var output = [Byte]()
        var carry: Byte = 0x0
        
        func process(_ byte: Byte, _ bitMask: Byte, _ carry: Byte = 0x0) {
            let maskedByte = byte & bitMask
            output.append(contentsOf: alphabet.map(carry | maskedByte))
        }
        
        func setCarry(_ byte: Byte, _ bitMask: Byte) {
            carry = byte & bitMask
        }
        
        for (index, _) in block.enumerated() {
            switch index {
            case 0:
                process( block[0] >> 3, _11111)
                setCarry(block[0] << 2, _11100)
            case 1:
                process( block[1] >> 6, _00011, carry)
                process( block[1] >> 1, _11111)
                setCarry(block[1] << 4, _11100)
            case 2:
                process( block[2] >> 4, _01111, carry)
                setCarry(block[2] << 1, _11110)
            case 3:
                process( block[3] >> 7, _00001, carry)
                process( block[3] >> 2, _11111)
                setCarry(block[3] << 3, _11000)
            case 4:
                process( block[4] >> 5, _00111, carry)
                setCarry(block[4]     , _11111)
            default:
                fatalError("block size must be <= 5 bytes")
            }
        }
        
        process(0x0, _00000, carry)
        
        return output
    }
    
}

private let _00000 = Byte(0)
private let _00001 = Byte(1)
private let _00011 = Byte(3)
private let _00111 = Byte(7)
private let _01111 = Byte(15)
private let _11000 = Byte(24)
private let _11100 = Byte(28)
private let _11110 = Byte(30)
private let _11111 = Byte(31)
