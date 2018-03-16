//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public struct Base32Encoder: ByteArrayEncoder {
    private let alphabet: Alphabet

    public static func encoder() -> Base32Encoder {
        return Base32Encoder(alphabet: Alphabet.base32())
    }

    func encode(bytes: [Byte]) throws -> [Byte] {
        let inputSize = bytes.count
        var output = [Byte]()
        var currentBlock = [Byte]()
        
        for (index, byte) in bytes.enumerated() {
            currentBlock.append(byte)
            
            let isFullBlock = currentBlock.count == 5
            let isLastByte = index == inputSize - 1
            
            if isFullBlock || isLastByte {
                output.append(contentsOf:encodeBlock(currentBlock, alphabet: alphabet))
                currentBlock = []
            }
        }

        let padding = paddingForInput(size: inputSize, paddingChar: alphabet.padding)
        output.append(contentsOf: padding)

        return output
    }

    private func encodeBlock(_ block: [Byte], alphabet: Alphabet) -> [Byte] {
        var output = [Byte]()
        var carry: Byte = 0x0

        func process(_ byte: Byte, _ bitMask: BitMask, _ carry: Byte = 0x0) {
            output.append(contentsOf: alphabet.map(carry | bitMask.mask(byte)))
        }

        func setCarry(_ byte: Byte, _ bitMask: BitMask) {
            carry = bitMask.mask(byte)
        }
        
        for (index, _) in block.enumerated() {
            switch index {
            case 0:
                process( block[0] >> 3, ._11111)
                setCarry(block[0] << 2, ._11100)
            case 1:
                process( block[1] >> 6, ._00011, carry)
                process( block[1] >> 1, ._11111)
                setCarry(block[1] << 4, ._11100)
            case 2:
                process( block[2] >> 4, ._01111, carry)
                setCarry(block[2] << 1, ._11110)
            case 3:
                process( block[3] >> 7, ._00001, carry)
                process( block[3] >> 2, ._11111)
                setCarry(block[3] << 3, ._11000)
            case 4:
                process( block[4] >> 5, ._00111, carry)
                setCarry(block[4]     , ._11111)
            default:
                fatalError("not implemented yet")
            }
        }
        
        process(0x0, .noMask, carry)

        return output
    }
    
}

