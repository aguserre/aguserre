//
//  ContentView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct TabBarView: View {

    @State var user: User
    @State private var isLoading = true
    @State private var selectedItem: TabBarItemModel = .person

    var body: some View {
        ZStack {
            VStack {
                selectedItem.viewToShow(user: self.user)
                Divider()
                HStack {
                    ForEach(TabBarItemModel.allItems, id: \.self) { item in
                        Spacer()
                        Button {
                            self.selectedItem = item
                        } label: {
                            Image(systemName: item.stringName)
                                .shadow(color: Color(UIColor.systemIndigo), radius: selectedItem == item ? 5 : 0)
                                .font(.system(size: 22, weight : .regular, design: .default ))
                                .foregroundColor(selectedItem == item ? Color(UIColor.systemIndigo) : Color(UIColor.lightGray))
                        }
                        Spacer()
                    }
                }
            }
            if isLoading {
                LoadView()
            }
        
        }.onAppear {
            fakeServiceCall()
        }
        
    }
    
    func fakeServiceCall() {
        ServiceManager().fetchData { user in
            guard let user = user else {
                //show alert / fake data will show
                isLoading.toggle()
                return
            }
            self.user = user
            isLoading.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(user: User())
        }
        .previewDevice("iPhone 12 Pro")
    }
}
