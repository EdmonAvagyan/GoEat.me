//
//  Delivery.swift
//  GoEat.me
//
//  Created by Edmon Avagyan on 13.03.23.
//

import Foundation


struct Delivery {
    var country: String?
    var csh: String?
    var housing: String?
    var house: String?
    var floor: String?
    var deliveryComment: String?
    
    enum Keys: String, CodingKey {
        case country
        case csh
        case housing
        case house
        case floor
        case deliveryComment
    }
    
    func encode(id: String) -> [String: Any] {
            let key = Delivery.Keys.self
            var array = [String: Any]()
            array[key.country.rawValue] = country
            array[key.csh.rawValue] = csh
            array[key.housing.rawValue] = housing
            array[key.house.rawValue] = house
            array[key.floor.rawValue] = floor
            array[key.deliveryComment.rawValue] = deliveryComment
            return array
        }
}
