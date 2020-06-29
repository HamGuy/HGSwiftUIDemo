//
//  CourseCardView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/6/29.
//

import SwiftUI

struct CourseCardView: View {
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Here is ther course title")
                        .foregroundColor(.white)
                        .frame(width: 140, alignment: .leading)
                        .font(.title)
                    Spacer()
                    
    //                Image()
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .frame(width: 320, height: 300)
            .background(Color("background7"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color("background7"), radius: 20,x: 0, y: 20)
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        CourseCardView()
    }
}
