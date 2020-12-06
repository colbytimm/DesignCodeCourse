//
//  CourseRow.swift
//  DesignCodeCourse
//
//  Created by Colby Timm on 2020-12-06.
//

import SwiftUI

struct CourseRow: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "paperplane.circle.fill")
                .renderingMode(.template)
                .frame(width: 48.0, height: 48.0)
                .imageScale(.medium)
                .background(Color.blue)
                .clipShape(Circle())
                .foregroundColor(.white)
                
            VStack(alignment: .leading, spacing: 4.0) {
                Text("Placeholder")
                    .font(.subheadline)
                    .bold()
                Text("Placeholder")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}