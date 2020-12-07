//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by Colby Timm on 2020-12-06.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    @Namespace var namespace
    @Namespace var namespace2
    
    var body: some View {
        ZStack {
            #if os(iOS)
            content
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.all))
            #else
            content
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
    }
    
    var content: some View {
        ScrollView() {
            VStack(spacing: 0) {
                Text("Courses")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    .padding(.top, 54)
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                    spacing: 16
                ) {
                    ForEach(courses) { course in
                        VStack {
                            CourseItem(course: course)
                                .matchedGeometryEffect(id: course.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                        show.toggle()
                                        selectedItem = course
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "containter\(course.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
                Text("Latest sections")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240))]) {
                    ForEach(courseSections) { item in
                        #if os(iOS)
                        NavigationLink(destination: CourseDetail(namespace: namespace2)) {
                            CourseRow(item: item)
                        }
                        #else
                        CourseRow(item: item)
                        #endif
                    }
                }
            }
        }
        .zIndex(1)
    }
    
    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                CourseDetail(course: selectedItem!, namespace: namespace)
                
                CloseButton()
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
