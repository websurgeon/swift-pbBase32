//
//

import Foundation

class TestVectors {
    static var base32: [ TestVector ] {
        return loadTestVectors(fileName: "TestVectorsBase32")
    }
    
    static var base32hex: [ TestVector ] {
        return loadTestVectors(fileName: "TestVectorsBase32hex")
    }
    
    static private func loadTestVectors(fileName: String) -> [ TestVector ] {
        let bundle = Bundle(for: self)
        let pathURL = bundle.url(forResource: fileName, withExtension: "json")!
        let jsonData = try! Data(contentsOf: pathURL, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        return try! decoder.decode([TestVector].self, from: jsonData)
    }
    
}
