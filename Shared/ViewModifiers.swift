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


// not worked
//struct SameSize: ViewModifier {
//    var alignment: Alignment = .center
//    func body(content: Content) -> some View {
//        content
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: alignment)
//    }
//}
