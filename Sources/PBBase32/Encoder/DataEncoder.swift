//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public protocol DataEncoder {
    
    func encode(data: Data) throws -> Data
    
}

