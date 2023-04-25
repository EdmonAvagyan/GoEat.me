//
//  NetworkManager.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 02.03.23.
//

import Foundation
import UIKit
import FirebaseFirestore

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func insertData(item: Basket, item1: Delivery) {
        let id = Firestore.firestore().collection("Product").document().documentID
        let data = item.encode(id: id)
        Firestore.firestore().collection("Product").document(id).setData(data) { error in
            if let error {
                print(error)
            } else {
                print("uxarkec")
            }
        }
        let id1 = Firestore.firestore().collection("Delivery").document().documentID
        let data1 = item1.encode(id: id1)
        Firestore.firestore().collection("Delivery").document(id1).setData(data1) { error in
            if let error {
                print(error)
            } else {
                print("uxarkec")
            }
        }
    }
    
}
