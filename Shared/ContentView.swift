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
    
    @State var showTitle = false
    @State var cardState = CGSize.zero
    @State var showCard = false
    
    let cardRounded = RoundedRectangle(cornerRadius: 16, style: .circular)
    
    var body: some View {
//        NavigationView(content: {
            ZStack {
                
                CertificationHeaderView()
                    .blur(radius: showTitle ? 20.0 : 0.0)
                    .opacity(showCard ? 0.4 : 1)
                    .offset(x: 0, y: showCard ? -200 : 0)
                    .animation(
                        Animation
                            .default
                            .delay(0.1)
                    )
                
                
                Rectangle()
                    .fill( showTitle ? Color.blue : Color.green)
                    .frame(width: showCard ? 280 : 320, height: 220, alignment: .center)
                    .clipShape(cardRounded)
                    .offset(x: 0, y: showTitle ? -400 : -40)
                    .offset(x: 0 , y: showCard ? -180: -40)
                    .scaleEffect(showCard ? 1 : 0.85)
                    .rotationEffect(.degrees( showTitle || showCard ? 0 : 10))
                    .animation(.easeInOut(duration: 0.5))
                
                Rectangle()
                    .fill( showTitle ? Color.green : Color.blue)
                    .frame(width: 320, height: 220, alignment: .center)
                    .clipShape(cardRounded)
                    .offset(x: 0, y: showTitle ? -200 : -20)
                    .offset(x: 0 , y: showCard ? -150: -20)
                    .scaleEffect( showCard ? 1: 0.95)
                    .rotationEffect(.degrees(showTitle || showCard ? 0 : 5))
                    .animation(.easeInOut(duration: 0.5))
                
                
                CourseCardView(course: self.course)
                    .background(Color(hex: 0x11))
                    .frame(width: showCard ? UIScreen.main.bounds.width - 10 : 320, height: 220, alignment: .center)
//                    .cornerRadius(16)
                    .clipShape(cardRounded)
                    .offset(x: cardState.width, y: cardState.height)
                    .offset(y: showCard ? -120 : 0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                    .onTapGesture {
//                        show.toggle()
                        showCard.toggle()
                    }
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                cardState = value.translation
                                showTitle = true
                            }.onEnded { _ in
                                cardState = .zero
                                showTitle = false
                            }
                    )
                
                CertificationBottomView()
                    .blur(radius: showTitle ? 20.0 : 0.0)
                    .offset(x: 0, y: showCard ? 360 : 1000)
                    .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.6))

                
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
        
    }
}
