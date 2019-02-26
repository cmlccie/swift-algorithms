import XCTest
@testable import swift_algorithms

final class swift_algorithmsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_algorithms().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
