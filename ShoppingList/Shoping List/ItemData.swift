//
//  ItemData.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import Foundation
import SwiftUI
import Combine


class Item: ObservableObject, Identifiable {
    var id : UUID
    var name : String
    var price : Float
    @Published var quantity : Int
    var image : String
    var weblink : String
    var gradientColors : [Color]
    @Published var showInList : Bool
    
    init(name: String, price: Float, image: String, weblink: String, gradientColors: [Color]) {
        id = UUID()
        self.name  = name
        self.price = price
        quantity = 0
        self.image = image
        self.weblink = weblink
        self.gradientColors = gradientColors
        showInList = false
    }
}

class Items: ObservableObject {
    @Published var array = [Item]()
}
