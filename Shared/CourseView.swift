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
                Image(uiImage: #imageLiteral(resourceName: "Logo1"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36, height: 36)
            }
            .padding(20)
            Spacer()
            Image(uiImage: #imageLiteral(resourceName: "Background1"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 180, alignment: .top)
        }
        .padding(20)
        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
        .frame(maxWidth: showAll ? .infinity : SCREEN_WIDTH - 60, maxHeight: showAll ? .infinity : 280)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius:20, x:0, y:20)
        .animation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 0))
        .onTapGesture {
            showAll.toggle()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView()
    }
}
