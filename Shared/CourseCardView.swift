//
//  CourseCardView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/6/29.
//

import SwiftUI

struct CourseCardView: View {
    var courseInfo: CourseInfo
    
    var body: some View {
        VStack {
            VStack (spacing: 10){
                HStack() {
                    Text(courseInfo.title)
                        .foregroundColor(.white)
                        .frame(width: 140, alignment: .leading)
                        .font(.title)
                    Spacer()
                    courseInfo.logo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 36, height: 36)
                }
                .padding(.horizontal)
                
                Text(courseInfo.section)
                    .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .textCase(.uppercase)
                    .modifier(SameWidth(alignment: .leading))
                    .padding(.leading, 10)
                
                courseInfo.pic
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .modifier(SameWidth())
                    
                
                Spacer()
            }
            .padding()
            .frame(width: 300, height: 300)
            .background(courseInfo.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: courseInfo.color.opacity(0.3), radius: 20,x: 0, y: 20)
            
            
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCardView(courseInfo: sampleData.first!)
    }
}

