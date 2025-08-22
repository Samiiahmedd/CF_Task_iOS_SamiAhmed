//
//  ContentView.swift
//  CF_Task_iOS_SamiAhmed
//
//  Created by Sami on 21/08/2025.
//

import UIKit

extension String {
    func coloredText(wordsWithColors: [UIColor: [String]]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for (color, words) in wordsWithColors {
            for word in words {
                let range = (self as NSString).range(of: word)
                if range.location != NSNotFound {
                    attributedString.addAttribute(.foregroundColor, value: color, range: range)
                }
            }
        }
        return attributedString
    }
}
