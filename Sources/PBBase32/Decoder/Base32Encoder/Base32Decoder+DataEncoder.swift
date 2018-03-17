//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension Base32Decoder: DataDecoder {
    
    public func decode(data: Data) throws -> Data {
        let output = try decode(bytes: [Byte](data))
        return Data(output)
    }
    
}

