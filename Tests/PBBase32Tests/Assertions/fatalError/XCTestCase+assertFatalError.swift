//
//  Copyright © 2018 Peter Barclay. All rights reserved.
//

import XCTest
@testable import PBBase32

extension XCTestCase {

    func assertFatalError(expectedMessage: String = "",
                          timeout: TimeInterval = 2,
                          inFile file: String = #file,
                          atLine line: Int = #line,
                          testcase: @escaping () -> Void) {
        let expectation = self.expectation(description: "expectingFatalError")
        var fatalErrorMessage: String? = nil
        
        FatalErrorReplacer.replace { message, _, _ in
            fatalErrorMessage = message
            expectation.fulfill()
            self.unreachable()
        }

        DispatchQueue.global(qos: .userInitiated).async(execute: testcase)
        
        waitForExpectations(timeout: timeout) { expectationError in
            FatalErrorReplacer.reset()
            if expectationError == nil {
                if fatalErrorMessage != expectedMessage {
                    let description = "expected fatalError with message '\(expectedMessage)', got '\(fatalErrorMessage ?? "nil")'"
                    self.recordFailure(withDescription: description,
                        inFile: file,
                        atLine: line,
                        expected: true)
                }
            }
        }
    }
    
    func unreachable() -> Never {
        repeat {
            RunLoop.current.run()
        } while (true)
    }
}
