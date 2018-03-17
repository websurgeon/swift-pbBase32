//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

public protocol DataDecoder {
    
    func decode(data: Data) throws -> Data
    
}
