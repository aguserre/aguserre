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
                    ContactView(gridItems: gridItems, numOfColumns: 2)
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

fileprivate let gridItems = [GridItem(height: 300, imageString: "github", url: "https://github.com/aguserre"),
                             GridItem(height: 250, imageString: "linkedin", url: "https://www.linkedin.com/in/agustin-errecalde-a853b767/"),
                             GridItem(height: 200, imageString: "facebook", url: "https://www.facebook.com/eagustiin"),
                             GridItem(height: 180, imageString: "instagram", url: "https://www.instagram.com/agustinerrecalde/"),
                             GridItem(height: 200, imageString: "twitter", url: "https://twitter.com/eagustiin")]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
        }
        .previewDevice("iPhone 12 Pro")
    }
}
