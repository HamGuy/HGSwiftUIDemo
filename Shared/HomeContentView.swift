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
    @Binding var showContent: Bool
    
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
            .padding(.horizontal,24)
            
            ScrollView(.horizontal, showsIndicators:false) {
                HStack (spacing:12){
                    ForEach(sampleCourseProgresses) { progress in
                        CourseRingView(ringSize: progress.title == nil ? 32 : 44 , coursePorgress: progress)
                            .padding(8)
                            .background(Color.white)
                            .cornerRadius(20)
                            .modifier(DoubleShadow())
                            .onTapGesture {
                                showContent.toggle()
                            }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            }
            .modifier(SameWidth())
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
                .offset(y: -30)
            }
            
            
                Text("25 Courses")
                    .frame(width: SCREEN_WIDTH - 60, alignment: .leading)
                    .offset(y: -50)
                
                ScrollView {
                    ForEach(sampleData) { course in
                        CourseCardView(courseInfo: course)
                            .frame(width: 300, height: 300)
                    }
                }
                .offset(y: -30)
            
            
            
            
//            Spacer()
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct CourseRingView: View {
    var ringSize: CGFloat = 44
    
    var coursePorgress: CourseProgress = sampleCourseProgresses.first!
    
    var body: some View {
        HStack {
            RingView(percent: coursePorgress.percent, width: ringSize ,showProgress: .constant(true))
            if let title = coursePorgress.title, let desc = coursePorgress.desc {
                
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(title)
                        .font(.custom("LibreBaskerville-Bold", size: 16, relativeTo: .subheadline))
                    Text(desc)
                        .font(.custom("LibreBaskerville-Regular", size: 16, relativeTo: .body))
                        .foregroundColor(.secondary)
                    
                }
            }
        }
    }
}
