//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

private let _11111: Byte = 0x1f
private let _11100: Byte = 0x1c
private let _00011: Byte = 0x03
private let _10000: Byte = 0x10
private let _01111: Byte = 0x0f
private let _11110: Byte = 0x1e
private let _00001: Byte = 0x01
private let _11000: Byte = 0x18
private let _00111: Byte = 0x07

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

        func process(_ byte: Byte, _ bitMask: Byte, _ carry: Byte = 0x0) {
            output.append(contentsOf: map(carry | (byte & bitMask)))
        }

        func setCarry(_ byte: Byte, _ bitMask: Byte) {
            carry = (byte & bitMask)
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
                fatalError("not implemented yet")
            }
        }
        
        output.append(contentsOf: map(carry))

        return output
    }
    
    public func map(_ byte: Byte) -> [Byte] {
        let char = alphabet.values[Int(byte)]
        let data = char.data(using: .ascii)!
        return [Byte](data)
    }

}

private func paddingForInput(size: Int, paddingChar: String) -> [Byte] {
    let blockSize = (size * 8) % 40
    let padding: String
    switch blockSize {
    case 0:
        padding = ""
    case 8:
        padding = String(repeating: paddingChar, count: 6)
    case 16:
        padding = String(repeating: paddingChar, count: 4)
    case 24:
        padding = String(repeating: paddingChar, count: 3)
    case 32:
        padding = String(repeating: paddingChar, count: 1)
    default:
        fatalError("invalid block size \(blockSize)")
    }
    let paddingData = padding.data(using: .ascii)!
    return [Byte](paddingData)
}
