//
//  HomeView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/6/28.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showProfile = false
    @State private var dragState = CGSize.zero
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            HomeContentView(showProfile: $showProfile, showContent: $showContent)
            .padding(.top, 44)//UIApplication.statusBarHeight)
            .background(
                VStack {
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                    Spacer()
                }
                .background(Color.white)
            )
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 30, x: 0, y: 20)
            .offset(y: showProfile ? -400 : 0)
            .rotation3DEffect(
                .degrees(showProfile ? Double(dragState.height/10 - 15) : 0),
                axis: (x: 12.0, y: 0.0, z: 0.0)
            )
            .scaleEffect(showProfile ? 0.9 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .edgesIgnoringSafeArea(.all)
            
            
            ProfileMenuView()
                .offset(y: showProfile ? -50 : SCREEN_HEIGHT)
                .offset( y: dragState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    showProfile.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                    dragState = value.translation
                        }.onEnded({ _ in
                            if dragState.height > 50 {
                                showProfile = false
                            }
                            dragState = .zero
                        })
                )
            
           
            
            if showContent {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            showContent = false
                        }) {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .background(Color.black)
                                .clipShape(Circle())
                        }
                        
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                
                ContentView()
                
                
                
            }
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AvatarView: View {
    
    @Binding var showProfile: Bool
    
    var avatar: String
    
    var body: some View {
        Button(action: {
            showProfile.toggle()
        }) {
            Image(avatar)
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
        }
    }
}
