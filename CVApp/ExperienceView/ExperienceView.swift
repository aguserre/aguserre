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
        }
    }
}


struct Experience {
    let data: [Job]
}

struct Job: Identifiable {
    let id = UUID()
    let type: JobType
    let name: String
    let position: String
    let dateStart: String
    let dateEnd: String
    let description: String
}

enum JobType: String {
    case auditor = "Auditor de Sistemas", developer = "Developer", other = "Otros"
}
fileprivate let experience = Experience(data: jobs)
fileprivate let jobs = [Job(type: .other, name: "GoodPeople", position: "Vendedor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
                        Job(type: .auditor, name: "Bertora", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
                        Job(type: .auditor, name: "BDO", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
                        Job(type: .auditor, name: "Tarshop", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
                        Job(type: .developer, name: "Gob. Ciudad", position: "iOS Dev", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
                        Job(type: .developer, name: "FluxIt", position: "iOS Dev", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl")]

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(selectedIndex: 3)
        }
        .previewDevice("iPhone 12 Pro")
    }
}

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()

        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }

    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}
