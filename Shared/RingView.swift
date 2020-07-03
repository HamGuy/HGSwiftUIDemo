//
//  RingView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/3.
//

import SwiftUI

struct RingView: View {
    var fromColor: Color = Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
    var toColor = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    var shadowColor =  Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.1)
    var percent: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 16
                                                                     , lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
            Circle()
                .trim(from: 1-percent/100,to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [fromColor, toColor]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0], dashPhase: 0))
                .rotationEffect(.degrees(90), anchor: .center)
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .shadow(color: shadowColor, radius: 3,x:0,y:3)
            HStack {
                Text("\(Int(ceil(percent)))")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("%")
                    .foregroundColor(Color(#colorLiteral(red: 0.6470588235, green: 0.6549019608, blue: 0.7960784314, alpha: 1)))
                    .frame(height: 40, alignment: .top)
                    .padding(.leading, -8)
                    .padding(.top, 17)
            }
        }
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0 , y: 3)
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percent: 82)
    }
}
