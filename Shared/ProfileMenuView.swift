//
//  ProfileMenuView.swift
//  HGSwiftUIDemp
//
//  Created by Miro on 2020/6/27.
//

import SwiftUI

struct ProfileMenuView: View {
    
    
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("Wang - 30% Completed")
                    .font(.caption)
                    .padding()
                Color.white
                    .frame(width: 30, height: 6)
                    .cornerRadius(3)
                    .frame(width: 100, height: 6,alignment: .leading)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 120, height: 24)
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(10)
                MenuItemView(icon: "gear", title: "Account")
                MenuItemView(icon: "creditcard.fill", title: "Billing")
                MenuItemView(icon: "person.3.fill", title: "Team")
            }
            .frame(width: 320, height: 240)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))]), startPoint: .top, endPoint: .bottom))
            .shadow(color:Color.black.opacity(0.1), radius: 20, x: 10, y: 10)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding()
            .overlay(
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -120)
                
            )
            
        }
    }
    
}


struct ProfileMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileMenuView()
    }
}

struct MenuItemView: View {
    
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            Text(title).frame(width: 180, alignment: .leading)
                .font(.system(size: 18, weight: .medium, design: Font.Design.monospaced))
        }
    }
}
