//
//  UIApplication+Extensiom.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/6/28.
//

import UIKit

extension UIApplication {
    class var statusBarHeight: CGFloat {
        var result: CGFloat
        if #available(iOS 13.0, *)  {
            let window = shared.windows.filter {$0.isKeyWindow}.first
            result = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        }
        else {
            result = shared.statusBarFrame.height
            print(result)
        }
        return result
    }
}
