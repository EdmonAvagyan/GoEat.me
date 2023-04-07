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
    
    func insertData(item: Product, item1: Delivery) {
        //et id = UIDevice.current.identifierForVendor?.uuidString ?? "no device"
        let id = Firestore.firestore().collection("order").document().documentID
        let data = item.encode(id: id)
        Firestore.firestore().collection("order").document(id).setData(data) { error in
            if let error {
                print(error)
            } else {
                print("uxarkec")
            }
        }
        let data1 = item1.encode(id: id)
        Firestore.firestore().collection("order").document(id).setData(data1) { error in
            if let error {
                print(error)
            } else {
                print("uxarkec")
            }
        }
    }
    
}
