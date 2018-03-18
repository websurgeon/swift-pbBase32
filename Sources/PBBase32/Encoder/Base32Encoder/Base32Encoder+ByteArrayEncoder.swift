//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Encoder: ByteArrayEncoder {
    
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
