//
//  Model.swift
//  Hotel Codable
//
//  Created by student on 11/04/24.
//

import UIKit
//2 reference nu compare
struct RoomType : Equatable {
    var id: Int
    var name : String
    var shortName : String
    var price : Int
    
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool{
        return lhs.id == rhs.id
    }
    //static - type binded value
    static var allTypes: [RoomType] {
        return(
            [
                RoomType(id: 1, name: "Two Queens", shortName: "2Qs", price: 170),
                RoomType(id: 2, name: "One King", shortName: "1K", price: 200),
                RoomType(id: 3, name: "Penthouse Suite", shortName: "PHS", price: 350)
            ]
        )
    }
    
}
