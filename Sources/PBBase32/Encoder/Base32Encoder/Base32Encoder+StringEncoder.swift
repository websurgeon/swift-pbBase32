//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Encoder: StringEncoder {
    
    public func encode(string: String) throws -> String {
        let data = Data(string.utf8)
        let encoded = try encode(bytes: [Byte](data))
        return String(data: Data(encoded), encoding: .ascii)!
    }
    
}

