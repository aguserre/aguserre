//
//  JobListRow.swift
//  CVApp
//
//  Created by Agustin Errecalde on 01/08/2021.
//

import SwiftUI

struct JobListRow: View {
    var job: Job
    @Binding var showingSheet: Bool
    @Binding var jobSelected: Job?

    var body: some View {
        Button (action: {
            self.jobSelected = job
            self.showingSheet.toggle()
        }) {
            HStack {
                VStack(alignment: .leading) {
                    Text(job.position)
                        .foregroundColor(Color.labelColor)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                    Text(job.dateStart + " - " + job.dateEnd)
                        .foregroundColor(Color.secondaryLabelColor)
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                }
                Spacer()
                Text(job.name)
                    .frame(width: UIScreen.main.bounds.width*0.3, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color.mainPurpleColor)
                    .lineLimit(2)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .minimumScaleFactor(0.01)
            }
            .padding()
        }
    }
}
