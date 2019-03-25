import XCTest
@testable import SwiftAlgorithms

func verifyPrimacyByTrialDivisionFor(candidate: Int) -> Bool {
    // Even number optimization
    if candidate == 2 { return true }
    if candidate % 2 == 0 { return false }

    // Eliminate redundant divisors optimization
    let largestDivisor = Int(sqrt(Double(candidate)))

    for divisor in stride(from: 3, to: largestDivisor, by: 2) {
        if candidate % divisor == 0 { return false }
    }

    return true
}

final class SwiftAlgorithmsTests: XCTestCase {
    func testPrimeGenerator() {
        PrimeGenerator.generate(numberOfPrimes: 1000)

        for prime in PrimeGenerator.primes {
            XCTAssert(verifyPrimacyByTrialDivisionFor(candidate: prime))
            XCTAssert(
                verifyPrimacyByTrialDivisionFor(candidate: prime),
                "PrimeGenerator is generating non-prime numbers.  \(prime) is not a prime number."
            )
        }
    }

    static var allTests = [
        ("testPrimeGenerator", testPrimeGenerator),
    ]
}
