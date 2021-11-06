//
//  Extension+Color.swift
//  mergeplus
//
//  Created by Tophun on 2021/11/04.
//

import Foundation
import UIKit

extension UIColor {

  // MARK: Red

  open class var mgRed: UIColor { return UIColor(named: "mgRed")! }
  open class var red255: UIColor { return UIColor(named: "red255")! }

  // MARK: Pink

  open class var mgPink: UIColor { return UIColor(named: "mgPink")! }

  // MARK: Yellow

  open class var mgYellow: UIColor { return UIColor(named: "mgYellow")! }

  // MARK: Green

  open class var mgGreen: UIColor { return UIColor(named: "mgGreen")! }

  // MARK: Purple

  open class var mgPurple: UIColor { return UIColor(named: "mgPurple")! }
  open class var purple75: UIColor { return UIColor(named: "purple75")! }
  open class var purple78: UIColor { return UIColor(named: "purple78")! }
  open class var purple7C: UIColor { return UIColor(named: "purple7C")! }
  open class var purple8F: UIColor { return UIColor(named: "purple8F")! }
  open class var purpleF1: UIColor { return UIColor(named: "purpleF1")! }
  open class var purpleFB: UIColor { return UIColor(named: "purpleFB")! }
  open class var purpleBB: UIColor { return UIColor(named: "purpleBB")! }

  // MARK: Black

  open class var black3A: UIColor { return UIColor(named: "black3A")! }
  open class var black48: UIColor { return UIColor(named: "black48")! }
  open class var black60: UIColor { return UIColor(named: "black60")! }
  open class var black70: UIColor { return UIColor(named: "black70")! }

  // MARK: Gray

  open class var gray61: UIColor { return UIColor(named: "gray61")! }
  open class var gray72: UIColor { return UIColor(named: "gray72")! }
  open class var gray97: UIColor { return UIColor(named: "gray97")! }
  open class var grayBC: UIColor { return UIColor(named: "grayBC")! }
  open class var grayCE: UIColor { return UIColor(named: "grayCE")! }
  open class var grayEB: UIColor { return UIColor(named: "grayEB")! }
  open class var grayF5: UIColor { return UIColor(named: "grayF5")! }

  // MARK: White

  open class var whiteFF: UIColor { return UIColor.white }
}

// MARK: - Initializers

public extension UIColor {

  convenience init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt32()
    Scanner(string: hex).scanHexInt32(&int)
    let a, r, g, b: UInt32
    switch hex.count {
    case 3: // RGB (12-bit)
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6: // RGB (24-bit)
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8: // ARGB (32-bit)
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }

  static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
    let d = CGFloat(255)
    return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
  }

  convenience init(red: Int, green: Int, blue: Int) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")

    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
  }

  convenience init(rgb: Int) {
    self.init(
      red: (rgb >> 16) & 0xFF,
      green: (rgb >> 8) & 0xFF,
      blue: rgb & 0xFF
    )
  }
}

extension UIColor {
  static var random: UIColor {
    return UIColor(red: .random(in: 0...1),
                   green: .random(in: 0...1),
                   blue: .random(in: 0...1),
                   alpha: 1.0)
  }
}

import SwiftUI

@available(iOS 13.0, *)
extension UIColor {
  var color: Color { Color(self) }
}
