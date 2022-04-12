//
//  Utils.swift
//  SwiftBank
//
//  Created by 劉瑞元 on 2022/4/8.
//

import Foundation

class Utils {
    static func readInput(prompt: String = "> ", includeEmpty: Bool = false) -> String {
        print(prompt, terminator: "")
        
        repeat {
            guard
                // Swift 2.2: guard let [Action], [Condition] else [Else-Action]
                //  However, in Swift 3 where has been replaced with `,`. where is removed.
                let response_str = readLine(strippingNewline: true), !response_str.isEmpty else {
                if includeEmpty {
                    return ""
                } else {
                    continue
                }
            }
            return response_str
        } while true
    }
    
    static func cleanScreen() {
        print("")
        print("")
    }
    
    static func pause() {
        readInput(prompt: "press Enter to the next", includeEmpty: true)
    }
}
