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
                        CourseCardView(courseInfo: course)
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
