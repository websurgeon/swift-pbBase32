//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public enum Base32DecoderError: Error {
    case invalidInputSize(size: Int)
    case invalidByte(byte: Byte, index: Int, processedOutput: [Byte])
    case notAsciiInput
    case invalidOutput(bytes: [Byte])
}

public struct Base32Decoder {
    let alphabet: Alphabet
    
    init(alphabet: Alphabet) {
        self.alphabet = alphabet
    }

}

