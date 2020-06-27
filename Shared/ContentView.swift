//
//  ContentView.swift
//  Shared
//
//  Created by Miro on 2020/6/24.
//

import SwiftUI

struct ContentView: View {
    
    var course: CourseIntro
    init() {
        self.course = CourseIntro(id: 0, name: "Section 1", briefIntro: "New Section", icon: "Logo", pic: Image("Illustration4"))
    }
    
    @State var show = false
    @State var cardState = CGSize.zero
    
    var body: some View {
//        NavigationView(content: {
            ZStack {
                
                CertificationHeaderView()
                    .blur(radius: show ? 20.0 : 0.0)
                    .animation(.easeInOut(duration: 0.5))
                
                
                Rectangle()
                    .fill( show ? Color.blue : Color.green)
                    .frame(width: 320, height: 220, alignment: .center)
                    .cornerRadius(16)
                    .offset(x: 0, y: show ? -400 : -40)
                    .scaleEffect(0.85).rotationEffect(.degrees( show ? 0 : 10))
                    .animation(.easeInOut(duration: 0.5))
                
                Rectangle()
                    .fill( show ? Color.green : Color.blue)
                    .frame(width: 320, height: 220, alignment: .center)
                    .cornerRadius(16)
                    .offset(x: 0, y: show ? -200 : -20)
                    .scaleEffect(0.95).rotationEffect(.degrees(show ? 0 : 5))
                    .animation(.easeInOut(duration: 0.5))
                
                
                CourseCardView(course: self.course)
                    .background(Color(hex: 0x11))
                    .frame(width: 320, height: 220, alignment: .center)
                    .cornerRadius(16)
                    .offset(x: cardState.width, y: cardState.height)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    .onTapGesture {
                        show.toggle()
                    }
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                cardState = value.translation
                                show = true
                            }.onEnded { _ in
                                cardState = .zero
                                show = false
                            }
                    )
                
                CertificationBottomView()
                    .blur(radius: show ? 20.0 : 0.0)
                    .animation(.easeInOut(duration: 0.5))
                
            }
            .blendMode(.hardLight)
            .background(Color(hex: 0x46b2e3))
//        }
//        .navigationTitle("Home")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CertificationHeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificate").foregroundColor(.white).font(.largeTitle).fontWeight(.bold)
                Spacer()
            }.padding()
            Image("Illustration1")
            Spacer()
        }
    }
}

struct CertificationBottomView: View {
    var body: some View {
        VStack (spacing: 20){
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .frame(width: 50, height: 5)
                .clipShape(Capsule())
                .padding(.top, 8)
                .padding(.horizontal, 24)
            Text("Currently, when I instantiate this view I'm required to pass both text and name names to arguments. I want to be able to make the name argument optional, like in the example below.")
                .lineSpacing(2.5)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .offset(x: 0, y: 500)
    }
}
