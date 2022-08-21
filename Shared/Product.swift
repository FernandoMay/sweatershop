//
//  Product.swift
//  sweatershop (iOS)
//
//  Created by Fernando May on 20/08/22.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Islander XL", image: "sueter1", price: 49),
                   Product(name: "Blue Milk", image: "sueter2", price: 57),
                   Product(name: "Alfari Congo", image: "sueter3", price: 36),
                   Product(name: "Miami Larq", image: "sueter4", price: 81),
                   Product(name: "Sed ODS", image: "sueter5", price: 62),
                   Product(name: "Variable og", image: "sueter6", price: 53),
                   Product(name: "Jevver Men 1", image: "sueter7", price: 64),
                   Product(name: "Sympethic M", image: "sueter8", price: 91)]
