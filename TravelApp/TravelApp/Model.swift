//
//  Model.swift
//  TravelApp
//
//  Created by Wang Yongwu on 2021/1/23.
//

import Foundation

struct Model : Identifiable {
    var id = UUID().uuidString
    var title : String
    var country : String
    var ratings : String
    var price : String
    var img : String
}

var data = [
    Model(title: "Carribean", country: "French", ratings: "4.9", price: "$200", img: "p1"),
    Model(title: "Big Sur", country: "USA", ratings: "4.1", price: "$150", img: "p2"),
]
