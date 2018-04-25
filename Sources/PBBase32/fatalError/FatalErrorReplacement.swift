//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import Foundation

struct FatalErrorReplacer {
    static var fatalErrorClosure: (String, StaticString, UInt) -> Never = defaultFatalErrorClosure
    private static let defaultFatalErrorClosure = { Swift.fatalError($0, file: $1, line: $2) }

    static func replace(with closure: @escaping (String, StaticString, UInt) -> Never) {
        fatalErrorClosure = closure
    }
    
    static func reset() {
        fatalErrorClosure = defaultFatalErrorClosure
    }
}

func fatalError(_ message: @autoclosure () -> String = "", file: StaticString = #file, line: UInt = #line) -> Never {
    FatalErrorReplacer.fatalErrorClosure(message(), file, line)
}



