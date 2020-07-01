//
//  HomeContentView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/6/28.
//

import SwiftUI

struct HomeContentView: View {
    
    @Binding var showProfile: Bool
    @State private var showModel = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Name Here").font(.callout)
                Spacer()
                AvatarView(showProfile: $showProfile, avatar: "avatar")
                Button(action: {
                    showModel.toggle()
                }) {
                    Image(uiImage: #imageLiteral(resourceName: "bell")).renderingMode(.original)
                        .frame(width: 30, height: 30)
                        .aspectRatio(contentMode: .fit)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y:2)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y:2)
                        
                }.sheet(isPresented: $showModel) {
                    CertificationCardView(course: sameleCourseIntro)
                }
                
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


let sameleCourseIntro = CourseIntro(id: 0, name: "Section 1", briefIntro: "New Section", icon: "Logo", pic: Image("Illustration4"))
