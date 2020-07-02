//
//  CourseListView.swift
//  HGSwiftUIDemo
//
//  Created by Miro on 2020/7/2.
//

import SwiftUI
import Combine

struct CourseListView: View {
    
    @ObservedObject var courseStore = CourseInfoStore()
    
    @State private var editMode = false
    
    func addStore()  {
        courseStore.updates.append(CourseInfo( title: "Framer Playground Item 2", briefIntro: "Create powerful animations and interactions with the Framer X code editor", date: "JUN 23" ,section: "8 Sections", logo: Image(uiImage: #imageLiteral(resourceName: "Logo1")), pic: Image(uiImage: #imageLiteral(resourceName: "Background1")), color: Color("background8")))
    }
    
    var body: some View {
        
        NavigationView {
            
            List{
                ForEach(courseStore.updates){ data in
                    
                    NavigationLink(destination: CourseDetailView(course: data)) {
                        HStack {
                            data.pic
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                                .cornerRadius(10)
                                .padding(.trailing, 6)
                            
                            
                            VStack(alignment: .leading) {
                                Text(data.title)
                                Text(data.briefIntro)
                                    .font(.caption)
                                    .lineLimit(2)
                                    .foregroundColor(.secondary)
                                Text(data.date)
                                    .font(.caption2)
                                    .padding(.top, 10)
                                Spacer()
                            }
                        }
                    }
                    
                }.onDelete { indexSet in
                    self.courseStore.updates.remove(at: indexSet.first!)
                }.onMove { indecies, newOffset in
                    self.courseStore.updates.move(fromOffsets: indecies, toOffset: newOffset)
                }
                
            }
            .navigationTitle("Course List")
            .navigationBarItems(leading: Button(action: addStore){
                Image(systemName:"plus")
            }, trailing: EditButton ())
            
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
