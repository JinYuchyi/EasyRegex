// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct EasyRegex: ParsableCommand {
    mutating func run() throws {
        let str = "1234sdas<aabbcc>#@asr"
        let matched = str.regex(pattern: "<.+>")
        print(matched)
    }
}
