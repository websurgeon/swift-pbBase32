//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Encoder: DataEncoder {
    
    public func encode(data: Data) throws -> Data {
        let output = try encode(bytes: [Byte](data))
        return Data(output)
    }
    
}

