//
//  CourseDetailView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/2.
//

import SwiftUI

struct CourseDetailView: View {
    var course: CourseInfo
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    course.pic
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .modifier(SameWidth())
                    
                    Text(course.briefIntro)
                        .font(.body)
                        .modifier(SameWidth(alignment: .leading))
                    
                    Spacer()
                        
                }.navigationTitle(course.title)
                .padding()
            }
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: sampleData.first!)
    }
}
