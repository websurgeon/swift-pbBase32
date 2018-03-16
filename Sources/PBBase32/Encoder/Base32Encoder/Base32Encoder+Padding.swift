//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Encoder {

    func paddingForInput(size: Int, paddingChar: String) -> [Byte] {
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

}
