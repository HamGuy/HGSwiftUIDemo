//
//  CourseListView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/2.
//

import SwiftUI

struct CourseListView: View {
    var body: some View {
        
        NavigationView {
            
            List(sampleData){ data in
                
                NavigationLink(destination: Text(data.title)) {
                    HStack {
                        data.icon
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .cornerRadius(10)
                            .padding(.trailing, 6)

                        
                        VStack(alignment: .leading) {
                            Text(data.title)
                            Text(data.desc).font(.caption2)
                            Spacer()
                        }
                    }
                }
                
            }
            .navigationTitle("Course List")
            
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
