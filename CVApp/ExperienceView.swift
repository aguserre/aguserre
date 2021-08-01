//
//  ExperienceView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct ExperienceView: View {
    
    @State var showingSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header:
                                Text("Otros")
                                    .foregroundColor(Color(UIColor.systemIndigo))
                                    .font(.system(size: 20, weight: .bold, design: .rounded)))
                    {
                        TaskRow(showingSheet: $showingSheet)
                    }
                    Section(header:
                                Text("Auditor de Sistemas")
                                    .foregroundColor(Color(UIColor.systemIndigo))
                                    .font(.system(size: 20, weight: .bold, design: .rounded)))
                    {
                        TaskRow(showingSheet: $showingSheet)
                        TaskRow(showingSheet: $showingSheet)
                        TaskRow(showingSheet: $showingSheet)
                    }

                    Section(header:
                                Text("Developer")
                                    .foregroundColor(Color(UIColor.systemIndigo))
                                    .font(.system(size: 20, weight: .bold, design: .rounded)))
                    {
                        TaskRow(showingSheet: $showingSheet)
                        TaskRow(showingSheet: $showingSheet)
                        TaskRow(showingSheet: $showingSheet)
                        TaskRow(showingSheet: $showingSheet)
                    }
                }.sheet(isPresented: $showingSheet) {
                    SheetView()
                }
                
            }
            .navigationTitle("Experience")

        }
    }
}

struct TaskRow: View {
    
    @Binding var showingSheet: Bool

    var body: some View {
        Button (action: {
            self.showingSheet.toggle()
        }) {
            HStack {
                Text("Task data goes here")
                    .foregroundColor(Color(UIColor.label))
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                Spacer()
                Text("Task data goes here")
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.system(size: 12, weight: .regular, design: .rounded))
            }
        
        }
    }
}

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("Press to dismiss") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
    }
}

struct ExperienceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(selectedIndex: 3)
        }
        .previewDevice("iPhone 12 Pro")
    }
}
