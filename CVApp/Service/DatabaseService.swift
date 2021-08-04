//
//  DatabaseService.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import FirebaseDatabase
import SwiftUI

final class DatabaseService {
    
    private var dataBaseRef: DatabaseReference!
    
    private func checkDatabaseReference() {
        if dataBaseRef != nil {
            dataBaseRef.removeAllObservers()
        }
    }
    
    func fetchData(completion: @escaping((User?)->(Void))) {
        checkDatabaseReference()
        dataBaseRef = Database.database().reference().child("language").child("en")

        dataBaseRef.observeSingleEvent(of: .value) { snapshot in
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                snapshots.forEach { snap in
                    guard let dic = snap.value as? [String : Any],
                    let data = try? JSONSerialization.data(withJSONObject:dic) else {
                        completion(nil)
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let userSettings = try decoder.decode(User.self, from: data)
                        completion(userSettings.isEmptyUser() ? nil : userSettings)
                        return
                    } catch {
                        debugPrint(error)
                        completion(nil)
                        return
                    }
                }
            } else {
                completion(nil)
                return
            }
        }
    }
}
