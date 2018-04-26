//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

extension String {
    var utf8Bytes: [Byte] {
        return [Byte](Data(self.utf8))
    }
}
