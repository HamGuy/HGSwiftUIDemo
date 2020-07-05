//
//  CourseDo.swift
//  HGSwiftUIDemp
//
//  Created by Miro on 2020/6/26.
//

import SwiftUI

struct CourseInfo: Identifiable {
    var id = UUID()
    var title: String
    var briefIntro: String
    var date: String
    var section: String
    var logo: Image
    var pic: Image
    var color: Color
    
}


struct CourseProgress: Identifiable {
    var id = UUID()
    var title:String?
    var desc: String?
    var percent: CGFloat
}


let sampleCourseProgresses = [
    CourseProgress(title: "6 Minutes", desc: "I do not know whuy", percent: 56),
    CourseProgress(percent: 64),
    CourseProgress(percent: 32),
    CourseProgress(percent: 78)
]

let sampleData = [
    CourseInfo(title: "Learn Swift UI", briefIntro: "Design and animate a high converting landing page with advanced interactions, payments and CMS",date:"Jan 1" ,section: "18 Sections", logo: Image(uiImage: #imageLiteral(resourceName: "Logo1")), pic: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color("background7")),
    CourseInfo(title: "Webflow", briefIntro: "Design and animate a high converting landing page with advanced interactions, payments and CMS", date: "OCT 17" ,section: "18 Sections", logo: Image(uiImage: #imageLiteral(resourceName: "Logo1")), pic: Image(uiImage: #imageLiteral(resourceName: "Illustration4")), color: Color("background5")),
    CourseInfo(title: "ProtoPie", briefIntro: "Quickly prototype advanced animations and interactions for mobile and Web.", date: "AUG 27", section: "18 Sections", logo: Image(uiImage: #imageLiteral(resourceName: "Logo1")), pic: Image(uiImage: #imageLiteral(resourceName: "Card5")), color: Color("background4")),
    CourseInfo( title: "SwiftUI", briefIntro: "Learn how to code custom UIs, animations, gestures and components in Xcode 11", date: "JUNE 26" ,section: "18 Sections", logo: Image(uiImage: #imageLiteral(resourceName: "Logo1")), pic: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color("background6")),
    CourseInfo( title: "Framer Playground", briefIntro: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 11" ,section: "18 Sections", logo: Image(uiImage: #imageLiteral(resourceName: "Logo1")), pic: Image(uiImage: #imageLiteral(resourceName: "Illustration1")), color: Color("background3")),
]
