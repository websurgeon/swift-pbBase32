//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

internal protocol ByteArrayDecoder {
    
    func decode(bytes: [Byte]) throws -> [Byte]

}
