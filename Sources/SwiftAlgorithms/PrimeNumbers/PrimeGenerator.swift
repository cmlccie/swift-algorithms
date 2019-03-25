//
//  PrimeGenerator.swift
//  SwiftAlgorithms
//
//  Created by Chris Lunsford on 3/24/19.
//

import Foundation

struct PrimeMultiple {
    let prime: Int
    var multiple: Int

    let increment: Int = 1

    func product() -> Int {
        return prime * multiple
    }

    func nextMultiple() -> PrimeMultiple {
        return PrimeMultiple(prime: prime, multiple: multiple + increment)
    }
}


public class PrimeGenerator : Sequence, IteratorProtocol {
    // Static class attributes
    public internal(set) static var primes: [Int] = []
    public internal(set) static var nextCandidate: Int = 2
    static var streamingSieve: [Int: Array<PrimeMultiple>] = [:]

    // Instance attritbutes
    var nextPrimeIndex: Int = 0
    public let upperLimit: Int?
    public internal(set) var upperLimitReached = false

    public init() {
        upperLimit = nil
    }

    public init(withUpperLimit upperLimit: Int) {
        self.upperLimit = upperLimit
    }

    public func next() -> Int? {
        guard upperLimitReached == false else { return nil }

        // Return the cached primes first
        let prime: Int
        if nextPrimeIndex < PrimeGenerator.primes.count {
            prime = PrimeGenerator.primes[nextPrimeIndex]
        } else {
            prime = PrimeGenerator.generateNextPrime()
        }

        if let limit = upperLimit {
            if prime <= limit {
                return prime
            } else {
                upperLimitReached = true
                return nil
            }
        }

        nextPrimeIndex += 1
        return prime
    }

    public static func generate(numberOfPrimes: Int) {
        while primes.count < numberOfPrimes {
            _ = generateNextPrime()
        }
    }

    static func generateNextPrime() -> Int {
        // Advance through the composites to the next prime
        while let multiples = streamingSieve[nextCandidate] {
            for multiple in multiples { advanceMultiple(multiple) }
            streamingSieve[nextCandidate] = nil
            nextCandidate += 1
        }

        // Process new prime number
        let newPrime = nextCandidate
        advanceMultiple(PrimeMultiple(prime: newPrime, multiple: 1))
        primes.append(newPrime)
        nextCandidate += 1
        return newPrime
    }

    static func advanceMultiple(_ multiple: PrimeMultiple) {
        let nextMultiple = multiple.nextMultiple()
        let nextProduct = nextMultiple.product()
        var nextMultiplesArray = streamingSieve[nextProduct] ?? Array<PrimeMultiple>()
        nextMultiplesArray.append(nextMultiple)
        streamingSieve[nextProduct] = nextMultiplesArray
    }
}
