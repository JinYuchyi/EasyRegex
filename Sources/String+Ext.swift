//
//  File.swift
//  
//
//  Created by Jin on 12/20/23.
//

import Foundation
import Cocoa

extension String {
    @available(macOS 13.0, *)
    func regex(pattern: String)  -> [String] {
        do {
            let regex = try Regex(pattern)
            let matches = self.matches(of: regex)
            let ranges = matches.map({$0.range})
            let outputList = getSubStrings(ranges: ranges)
            return outputList
        } catch {
            let targetStr = self.getRange(start: 0, end: 10) + "..."
            print(error)
        }
        return []

    }

    func replaceByRegex(pattern: String, newStr: String) -> String {
        var input = self
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(input.startIndex..<input.endIndex, in: input)
        let output = regex.stringByReplacingMatches(in: input, options: [], range: range, withTemplate: newStr)
        return output
    }


    func getSubStrings(ranges: [Range<String.Index>]) -> [String] {
        var list: [String] = []
        for range in ranges {
            let _str = String(self[range])
            list.append(_str)
        }
        return list
    }

    func getRange(start: Int, end: Int) -> String {
        let count = self.count
        if count == 0 {return ""}
        var _start = start
        var _end = end
        if start < 0 { _start = start + count}
        if end > count - 1 {
            _end = count - 1
        }
        return String(Array(self)[_start..._end])
    }
}
