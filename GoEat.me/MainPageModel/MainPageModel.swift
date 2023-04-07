//
//  MainPageModel.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 06.03.23.
//

import Foundation
import UIKit

struct Category {
    var id: String
    var name: String
    var image: UIImage
}

struct Product {
    var id: String
    var name: String
    var image: UIImage
    var categoryId: String
    var price: String
    
    enum Keys: String, CodingKey {
        case id
        case name
        case image
        case categoryId
        case price
    }
    
    func encode(id: String) -> [String: Any] {
            let key = Product.Keys.self
            var array = [String: Any]()
            array[key.id.rawValue] = id
            array[key.name.rawValue] = name
            array[key.image.rawValue] = ""
            array[key.categoryId.rawValue] = categoryId
            array[key.price.rawValue] = price
            return array
        }
}

//struct Order {
//    let product: Product
//    let delivery: Delivery
//}
