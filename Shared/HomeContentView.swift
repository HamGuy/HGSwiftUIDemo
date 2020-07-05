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
                    CourseListView()
                }
                
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20.0) {
                    HStack {
                        RingView(percent: 56, width: 44 ,showProgress: .constant(true))
                        VStack(alignment: .leading, spacing: 4.0) {
                            Text("6 Minutes")
                                .font(.custom("LibreBaskerville-Bold", size: 16, relativeTo: .subheadline))
                            Text("I do not know why")
                                .font(.custom("LibreBaskerville-Regular", size: 16, relativeTo: .body))
                                .foregroundColor(.secondary)
                            
                        }
                    }
                    
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(8)
                    .modifier(DoubleShadow())
                    HStack {
                        RingView(percent: 36, width: 44 ,showProgress: .constant(true))
                    }
                    .padding(8)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .modifier(DoubleShadow())
                    HStack{
                        RingView(percent: 27, width: 44 ,showProgress: .constant(true))
                    }
                    .padding(8)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .modifier(DoubleShadow())
                }
            }
            .padding(20)
            
            
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
