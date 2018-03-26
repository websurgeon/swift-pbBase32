//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//
import Foundation

extension TestVectors {
    static func loadTestVectors(type: EncodingType) -> [ TestVector ] {
        let bundle = Bundle(for: self)
        let pathURL = bundle.url(forResource: type.fileName, withExtension: "json")!
        let jsonData = try! Data(contentsOf: pathURL, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        return try! decoder.decode([TestVector].self, from: jsonData)
    }
}


