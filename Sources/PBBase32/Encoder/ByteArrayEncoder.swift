//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

internal protocol ByteArrayEncoder {
    
    func encode(bytes: [Byte]) throws -> [Byte]

}

