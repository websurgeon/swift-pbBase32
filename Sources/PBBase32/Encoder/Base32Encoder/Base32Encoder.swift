//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

private let _11111: Byte = 0x1f
private let _11100: Byte = 0x1c

public struct Base32Encoder: ByteArrayEncoder {
    private let alphabet: Alphabet

    public static func encoder() -> Base32Encoder {
        return Base32Encoder(alphabet: Alphabet.base32())
    }

    func encode(bytes: [Byte]) throws -> [Byte] {
        let inputSize = bytes.count
        var output = [Byte]()
        var block = bytes

        if block.count > 0 {
            output.append(contentsOf: map((block[0] >> 3) & _11111))
            output.append(contentsOf: map((block[0] << 2) & _11100))
        }
        
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
