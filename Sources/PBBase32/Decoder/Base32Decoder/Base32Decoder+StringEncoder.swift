//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Decoder: StringDecoder {
    
    public func decode(string: String) throws -> String {
        let data = string.data(using: .ascii)!
        let decoded = try decode(bytes: [Byte](data))
        return String(data: Data(decoded), encoding: .utf8)!
    }
    
}

