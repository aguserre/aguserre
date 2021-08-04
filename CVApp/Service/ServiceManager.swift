//
//  APIService.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import SwiftUI

class ServiceManager {
    
    private var dataBaseRef: DatabaseReference!
    private var storageRed: StorageReference!
    
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

class StorageManager: ObservableObject {
    let storage = Storage.storage()

    func listAllFiles(user: User, handler: @escaping (([GridItem]?)->(Void))) {
        var counter = 0
        var gridWithImage = [GridItem]()
        if let userData = user.social?.socialData {
            for grid in userData {
                var g = grid
                let pathReference = storage.reference(forURL: "gs://cvapp-16f91.appspot.com/\(g.imageString).jpeg")
                pathReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if let data = data {
                        if let image = UIImage(data: data) {
                            g.socialImage = image
                            gridWithImage.append(g)
                            counter += 1
                            debugPrint(counter, userData.count)

                            if counter == userData.count {
                                handler(gridWithImage)
                            }
                        } else {
                            counter += 1
                            if counter == userData.count {
                                handler(nil)
                            }
                        }
                    } else {
                        counter += 1
                        if counter == userData.count {
                            handler(nil)
                        }
                    }
                }
            }
        } else {
            handler(nil)
        }
    }

}
