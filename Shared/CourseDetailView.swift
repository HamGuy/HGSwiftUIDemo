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
            VStack {
                course.pic
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, alignment: .center)
                
                Text(course.briefIntro)
                    .font(.caption)
                
                Spacer()
                    
            }.navigationTitle(course.title)
            .padding()
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: sampleData.first!)
    }
}
