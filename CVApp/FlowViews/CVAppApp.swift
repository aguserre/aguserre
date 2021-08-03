//
//  CVAppApp.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI
import Firebase

@main
struct CVAppApp: App {
        
    init() {
      FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            TabBarView(user: User())
        }
    }
}
