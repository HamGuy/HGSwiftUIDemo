//
//  CourseView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/6.
//

import SwiftUI

struct CourseView: View {
    @State private var showAll = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16.0) {
                Text("The Fruta sample app builds an app for macOS, iOS, and iPadOS that implements SwiftUI platform features like widgets or app clips. Users can order smoothies, save favorite drinks, collect rewards, and browse recipes.")
                Text("The sample app’s Xcode project includes widget extensions that enable users to add a widget to their iOS Home screen or the macOS Notification Center and view their rewards or a favorite smoothie. The Xcode project also includes an app clip target. With the app clip, users can discover and instantly launch some of the app’s functionality on their iPhone or iPad without installing the full app")
            }
            .padding()
            .frame(maxWidth: showAll ? .infinity : SCREEN_WIDTH - 60, maxHeight: showAll ? .infinity : 0)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0 , y: 20)
            .offset(y: showAll ? 100 : 0)
            .opacity(showAll ? 1 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("Learn Swift UI")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text("20 sections")
                            .foregroundColor(Color.white.opacity(0.7))
                    }
                    Spacer()
                    ZStack {
                        Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(showAll ? 0 : 1)
                        Image(systemName: "xmark")
                            .opacity(showAll ? 1 : 0)
                            .foregroundColor(.white)
                    }
                    .frame(width: 36, height: 36)
                    .background(Color.black)
                    .clipShape(Circle())
                    .onTapGesture {
                        showAll = false
                    }
                }
                Spacer()
                
                Image(uiImage: #imageLiteral(resourceName: "Background1"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 180, alignment: .top)
                
            }
            .padding(20)
            .padding(.top, showAll ? 20 : 0)
            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .frame(maxWidth: showAll ? .infinity : SCREEN_WIDTH - 60, maxHeight: showAll ? 360 : 280)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius:20, x:0, y:20)
            .onTapGesture {
                showAll.toggle()
            }
        }
        .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
