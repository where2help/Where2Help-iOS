//
//  ColorUtils.swift
//  Bopster
//
//  Created by Aaron Cruz on 6/17/15.
//  Copyright (c) 2015 Aaron Cruz. All rights reserved.
//

import UIKit

struct ColorUtils {
    static func hexToUIColor (hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var rgbValue: UInt32 = 0
        let scanner = NSScanner(string: hex)
        scanner.scanLocation = 1
        scanner.scanHexInt(&rgbValue)
        let red = (CGFloat((rgbValue & 0xFF0000) >> 16)) / 255.0
        let green = (CGFloat((rgbValue & 0xFF00) >> 8)) / 255.0
        let blue = CGFloat((rgbValue & 0xFF)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
