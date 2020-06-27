//
//  CourseCardTypeA.swift
//  HGSwiftUIDemp
//
//  Created by Miro on 2020/6/26.
//

import SwiftUI

struct CourseCardView: View {
    
    var course: CourseIntro
    
    init(course:CourseIntro) {
        self.course = course
    }
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading, content: {
                    Text(course.name).font(.title).foregroundColor(.red).fontWeight(.medium)
                    Text(course.briefIntro).font(.body).foregroundColor(.white)
                })
                Spacer()
                Image(course.icon).resizable().frame(width: 40, height: 40, alignment: .top)

            }.padding()
            Spacer()
            course.pic.resizable().aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct CourseCardView_Previews: PreviewProvider {
    static var previews: some View {
        let info = CourseIntro(id: 0, name: "Section 1", briefIntro: "New Section", icon: "Logo", pic: Image("Illustration4"))
        return CourseCardView(course: info)
            .background(Color.black)
            .frame(width: 320, height: 220, alignment: .center)
            .cornerRadius(16)
    }
}
