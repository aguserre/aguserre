//
//  StorageService.swift
//  CVApp
//
//  Created by Agustin Errecalde on 04/08/2021.
//
import FirebaseStorage
import SwiftUI


final class StorageManager: ObservableObject {

    private let storage = Storage.storage()
    
    func getUserImage(user: User , handler: @escaping ((Image?)->(Void))) {
        let pathReference = storage.reference(forURL: "gs://cvapp-16f91.appspot.com/userProfile/userProfile.jpeg")
        pathReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            handler( Image(uiImage: (UIImage(data: (data ?? Data())) ?? UIImage() )) )
        }
    }

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
