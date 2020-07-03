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
    var percent: CGFloat = 88
    var width: CGFloat = 100
    
    var body: some View {
        let scaleFactor: CGFloat = width / 44
        let progress = 1 - percent/100
        
       return  ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * scaleFactor
                                                                     , lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20 * scaleFactor,0], dashPhase: 0))
            Circle()
                .trim(from: progress ,to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [fromColor, toColor]), startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 5 * scaleFactor, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20 * scaleFactor,0], dashPhase: 0))
                .rotationEffect(.degrees(90), anchor: .center)
                .rotation3DEffect(
                    .degrees(180),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .shadow(color: shadowColor, radius: 3 * scaleFactor,x:0,y:3 * scaleFactor)
        HStack(alignment:.top) {
                Text("\(Int(ceil(percent)))")
                    .font(.system(size: 16 * scaleFactor))
                    .fontWeight(.semibold)
                Text("%")
                    .font(.system(size: 10*scaleFactor))
                    .foregroundColor(Color(#colorLiteral(red: 0.6470588235, green: 0.6549019608, blue: 0.7960784314, alpha: 1)))
                    .frame(height: 40, alignment: .top)
                    .padding(.leading, -8)
                    .padding(.top,10)
            }
        }
        .frame(width: width, height: width)
        .shadow(color: Color.black.opacity(0.1), radius: 3*scaleFactor, x: 0 , y: 3*scaleFactor)
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percent: 82)
    }
}
