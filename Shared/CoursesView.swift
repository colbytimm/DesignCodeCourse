//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Colby Timm on 2020-12-06.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            CourseItem()
                .frame(width: 335, height: 250)
            VStack {
                if show {
                    CourseItem()
                        .transition(.move(edge: .trailing))
                        .edgesIgnoringSafeArea(.all) //ignores safe area
                }
            }
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
//        .animation(.spring())
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
