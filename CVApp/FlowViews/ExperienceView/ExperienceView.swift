//
//  ExperienceView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct ExperienceView: View {
    
    @State var showingSheet = false
    let sections = experience.data.map { $0.type }.removingDuplicates()
    @State var jobSelected: Job? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(experience.data.map { $0.type }.removingDuplicates(), id: \.self) { section in
                        Section(header:
                            Text(section.rawValue)
                            .foregroundColor(Color(UIColor.systemIndigo))
                            .font(.system(size: 20, weight: .bold, design: .rounded))) {
                            ForEach(experience.data, id: \.name) { job in
                                if job.type == section {
                                    JobListRow(job: job, showingSheet: $showingSheet, jobSelected: $jobSelected)
                                }
                            }
                        }
                    }
                }.sheet(isPresented: $showingSheet) {
                    JobDetailSheetView(job: $jobSelected)
                }
            }
            .navigationTitle("Experience")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    ToolBarItemImage(item: .latch)
                }
            }
        }
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //TabBarView(selectedIndex: 3)
        }
        .previewDevice("iPhone 12 Pro")
    }
}
