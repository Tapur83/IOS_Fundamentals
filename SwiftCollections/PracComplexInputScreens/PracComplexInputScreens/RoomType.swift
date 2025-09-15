//
//  RoomType.swift
//  PracComplexInputScreens
//
//  Created by Tapur Aggarwal on 27/08/25.
//

import Foundation

struct RoomType: Equatable{
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    
    static func == (lhs: RoomType, rhs: RoomType) -> Bool{
        return lhs.id == rhs.id
    }
    
    
    static var all: [RoomType]{
        return [RoomType(id: 0, name: "two Queens", shortName: "2Q", price: 179),
                RoomType(id: 1, name: "One King", shortName: "K", price: 209),
                RoomType(id: 2, name: "PentHouse Suite", shortName: "PHT", price: 309)]
    }
}
