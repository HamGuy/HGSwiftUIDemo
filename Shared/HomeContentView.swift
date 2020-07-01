//
//  HomeContentView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/6/28.
//

import SwiftUI

struct HomeContentView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Name Here").font(.callout)
                Spacer()
                AvatarView(showProfile: $showProfile, avatar: "avatar")
                
            }
            .padding(.horizontal)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(sampleData) { course in
                        GeometryReader{ geometry in
                            CourseCardView(courseInfo: course)
                                .rotation3DEffect(
                                    .degrees(Double(
                                    geometry.frame(in: .global).minX) - 30) / -20,
                                    axis: (x: 0.0, y: 20.0, z: 0.0)
                                )
                        }
                        .frame(width: 300, height: 300)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            Spacer()
            
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        HomeContentView(showProfile: .constant(false))
    }
}
