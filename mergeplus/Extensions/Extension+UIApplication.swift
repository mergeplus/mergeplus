//
//  Extension+UIApplication.swift
//  mergeplus
//
//  Created by Tophun on 2021/11/04.
//

import Foundation
import UIKit

extension UIApplication {
  
  var keyWindow: UIWindow? {
    return UIApplication.shared.connectedScenes
      .filter { $0.activationState == .foregroundActive }
      .map { $0 as? UIWindowScene }
      .compactMap { $0 }.first?.windows.filter { $0.isKeyWindow }.first
  }
}
