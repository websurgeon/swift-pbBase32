//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

private let paddingMap = [ 0: 0, 8: 6, 16: 4, 24: 3, 32: 1 ]

extension Base32Encoder {

    func paddingForInput(size: Int, paddingChar: String) -> [Byte] {
        let blockSize = (size * 8) % 40
        let padding = String(repeating: paddingChar, count: paddingMap[blockSize]!)
        let paddingData = padding.data(using: .ascii)!
        return [Byte](paddingData)
    }

}
