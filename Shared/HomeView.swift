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
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                HStack {
                    Text("Name Here").font(.callout)
                    Spacer()
                    Button(action: {
                        showProfile.toggle()
                    }) {
                        Image("avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                        
                    }
                    
                }
                .padding(.horizontal)
                
                Spacer()
                
            }
            .padding(.top, 44)//UIApplication.statusBarHeight)
            .background(Color.white)
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
                .offset(y: showProfile ? -50 : 500)
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
                        }))
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
