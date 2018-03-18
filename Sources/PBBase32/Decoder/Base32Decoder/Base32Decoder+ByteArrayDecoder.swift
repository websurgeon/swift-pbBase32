//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public enum Base32DecoderError: Error {
    case invalidInput(size: Int)
    case invalidByte(byte: Byte, index: Int, processedOutput: [Byte])
}

extension Base32Decoder: ByteArrayDecoder {

    func decode(bytes input: [Byte]) throws -> [Byte] {
        
        let inputSize = input.count
        guard validInputSize(inputSize) else {
            throw Base32DecoderError.invalidInput(size: inputSize)
        }
        
        var output = [Byte]()
        var currentBlock = [Byte]()
        for (index, byte) in input.enumerated() {
            if let base32Index = alphabet.index(of: byte) {
                currentBlock.append(Byte(base32Index))
            } else if isNotPadding(byte: byte) {
                throw Base32DecoderError.invalidByte(byte: byte,
                                                     index: index,
                                                     processedOutput: output)
            }
            
            let isFullBlock = currentBlock.count == 8
            let isLastByte = index == inputSize - 1
            
            if isFullBlock || isLastByte {
                output.append(contentsOf: decodeBlock(currentBlock, alphabet: alphabet))
                currentBlock = []
            }
        }
        
        return output
    }
    
    private func isNotPadding(byte: Byte) -> Bool{
        return byte != [Byte](alphabet.padding.data(using: .ascii)!)[0]
    }
    
    private func validInputSize(_ size: Int) -> Bool {
        switch size % 8 {
        case 0, 2, 4, 7: return true
        default: return false
        }
    }
}

