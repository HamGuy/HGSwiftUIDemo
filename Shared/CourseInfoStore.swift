//
//  CourseInfoStore.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/2.
//

import SwiftUI
import Combine

class CourseInfoStore: ObservableObject {
    @Published var updates :[CourseInfo] = sampleData
}
