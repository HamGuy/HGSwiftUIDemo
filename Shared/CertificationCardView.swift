//
//  CourseCardTypeA.swift
//  HGSwiftUIDemp
//
//  Created by Miro on 2020/6/26.
//

import SwiftUI

struct CertificationCardView: View {
    
    var course: CourseInfo
    
    var body: some View {
        VStack {
            HStack{
                VStack(alignment: .leading, content: {
                    Text(course.title).font(.title).foregroundColor(.red).fontWeight(.medium)
                    Text(course.briefIntro).font(.body).foregroundColor(.white)
                })
                Spacer()
                course.pic.resizable().frame(width: 40, height: 40, alignment: .top)

            }.padding()
            Spacer()
            course.pic.resizable().aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 110, alignment: .top)
        }
    }
}

struct CertificationCardView_Previews: PreviewProvider {
    static var previews: some View {
        return CertificationCardView(course: sampleData.first!)
            .background(Color.black)
            .frame(width: 320, height: 220, alignment: .center)
            .cornerRadius(16)
    }
}
