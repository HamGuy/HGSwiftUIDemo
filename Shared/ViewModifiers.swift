//
//  ViewModifiers.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/1.
//

import SwiftUI

struct SameWidth: ViewModifier {
    var alignment: Alignment = .center
    func body(content: Content) -> some View {
        return content.frame(minWidth: 0, maxWidth: .infinity, alignment: alignment)
    }
}

struct SameHeight: ViewModifier {
    var alignment: Alignment = .center
    func body(content: Content) -> some View {
         content
            .frame(minHeight: 0, maxHeight: .infinity, alignment: alignment)
    }
}

struct DoubleShadow: ViewModifier {
    
    var color = Color.black
    var radius1: CGFloat = 20
    var radius2: CGFloat = 2
    
    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(0.1), radius: radius1, x: 0, y:radius1)
            .shadow(color: color.opacity(0.2), radius: radius2, x: 0, y:radius2)

    }
}


// not worked
//struct SameSize: ViewModifier {
//    var alignment: Alignment = .center
//    func body(content: Content) -> some View {
//        content
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: alignment)
//    }
//}
