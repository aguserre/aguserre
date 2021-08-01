//
//  ContentView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedIndex = 0
    let icons = ["person", "graduationcap", "cpu", "latch.2.case", "message"]
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    PersonalView()
                case 1:
                    AcademyView()
                case 2:
                    SkillsView()
                case 3:
                    ExperienceView()
                default:
                    ContactView()
                }
            }
            Divider()
            HStack {
                ForEach(0..<5, id: \.self) { number in
                    Spacer()
                    Button {
                        self.selectedIndex = number
                    } label: {
                        Image(systemName: icons[number])
                            .shadow(color: Color(UIColor.systemIndigo), radius: selectedIndex == number ? 5 : 0)
                            .font(.system(size: 22, weight : .regular, design: .default ))
                            .foregroundColor(selectedIndex == number ? Color(UIColor.systemIndigo) : Color(UIColor.lightGray))
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
        }
        .previewDevice("iPhone 12 Pro")
    }
}
