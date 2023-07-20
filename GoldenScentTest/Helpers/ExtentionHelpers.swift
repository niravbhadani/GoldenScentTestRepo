//
//  ExtentionHelpers.swift
//  GoldenScentTest
//
//  Created by Nirav Bhadani on 20/07/23.
//

import UIKit


extension String {
    
    func convetToCGFlot() -> CGFloat? {
        if let number = NumberFormatter().number(from: self) {
            return CGFloat(truncating: number)
        }
        return nil
    }
    
    func convertToUIColor() -> UIColor? {
        let r, g, b, a: CGFloat

        if self.hasPrefix("#") {
            let start = self.index(self.startIndex, offsetBy: 1)
            let hexColor = String(self[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    return UIColor(red: r, green: g, blue: b, alpha: a)
                }
            }
        }
        return nil
    }
}
