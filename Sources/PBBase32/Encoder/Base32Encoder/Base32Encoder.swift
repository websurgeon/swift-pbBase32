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
    
}

