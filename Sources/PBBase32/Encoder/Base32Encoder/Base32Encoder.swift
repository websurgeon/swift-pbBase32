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

public struct Base32Encoder: ByteArrayEncoder {
    private let alphabet: Alphabet

    public static func encoder() -> Base32Encoder {
        return Base32Encoder(alphabet: Alphabet.base32())
    }

    func encode(bytes: [Byte]) throws -> [Byte] {
        let inputSize = bytes.count
        guard inputSize > 0 else { return [] }
        var output = [Byte]()
        var block = bytes
        var carry: Byte = 0x0
        

        for (index, _) in block.enumerated() {
            switch index {
            case 0:
                output.append(contentsOf: map((block[0] >> 3) & _11111))
                carry = (block[0] << 2) & _11100
            case 1:
                output.append(contentsOf: map(carry | (block[1] >> 6) & _00011))
                output.append(contentsOf: map((block[1] >> 1) & _11111))
                carry = (block[1] << 4) & _11100
            case 2:
                output.append(contentsOf: map(carry | (block[2] >> 4) & _01111))
                carry = (block[2] << 1) & _11110
            case 3:
                output.append(contentsOf: map(carry | (block[3] >> 7) & _00001))
                output.append(contentsOf: map((block[3] >> 2) & _11111))
                carry = (block[3] << 3) & _11000
            default:
                fatalError("not implemented yet")
            }
        }

        output.append(contentsOf: map(carry))

        let padding = paddingForInput(size: inputSize, paddingChar: alphabet.padding)
        output.append(contentsOf: padding)

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
