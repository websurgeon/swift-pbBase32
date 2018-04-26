//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension String {
    var asciiBytes: [Byte] {
        return [Byte](self.data(using: .ascii)!)
    }
}
