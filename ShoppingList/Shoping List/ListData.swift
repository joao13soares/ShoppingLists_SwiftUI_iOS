//
//  ListData.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import Foundation
import SwiftUI
import Combine


class ShoppingList: ObservableObject, Identifiable {
    var id : UUID
    var name : String
    @Published var items : Items
    @Published var cost : Float
    var image : String
    var gradientColors : [Color]
    
    init(name : String) {
        id = UUID()
        self.name = name
        items = itemsDefaultData()
        cost = 0
        image = "cart.fill"
        gradientColors = [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]
        
        cost = calcCost() // tem de ficar em último porque usa o self
    }
    
    func calcCost() -> Float {
        var cost : Float = 0.0
        
        for item in self.items.array {
            if item.showInList {
                cost += item.price * Float(item.quantity)
            }
        }
        
        return cost
    }
}

class ShoppingLists: ObservableObject {
    @Published var array = [ShoppingList]()
}

func itemsDefaultData() -> Items {
    var i = Items()
    i.array = [
        Item(
            name: "Maçã",
            price: 1.00,
            image: "apple",
            weblink: "https://en.wikipedia.org/wiki/Apple",
            gradientColors: [Color("ColorAppleLight"), Color("ColorAppleDark")]),
        Item(
            name: "Pêra",
            price: 1.50,
            image: "pear",
            weblink: "https://en.wikipedia.org/wiki/Pear",
            gradientColors: [Color("ColorPearLight"), Color("ColorPearDark")]),
        Item(
            name: "Arroz",
            price: 0.75,
            image: "rice",
            weblink: "https://en.wikipedia.org/wiki/Rice",
            gradientColors: [Color(.lightGray), Color(.darkGray)]),
        Item(
            name: "Água",
            price: 1.25,
            image: "water_bottle",
            weblink: "https://en.wikipedia.org/wiki/Water_bottle",
            gradientColors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]),
        Item(
            name: "Banana",
            price: 0.95,
            image: "banana",
            weblink: "https://en.wikipedia.org/wiki/Banana",
            gradientColors: [Color("ColorLemonLight"), Color("ColorLemonDark")]),
        Item(
            name: "Perfume",
            price: 10.00,
            image: "perfume",
            weblink: "https://en.wikipedia.org/wiki/Perfume",
            gradientColors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]),
        Item(
            name: "Ração Cães",
            price: 5.75,
            image: "dog_food",
            weblink: "https://en.wikipedia.org/wiki/Dog_food",
            gradientColors: [Color("ColorPomegranateLight"), Color("ColorPomegranateDark")]),
        Item(
            name: "Alface",
            price: 1.00,
            image: "lettuce",
            weblink: "https://en.wikipedia.org/wiki/Lettuce",
            gradientColors: [Color("ColorCherryLight"), Color("ColorCherryDark")]),
        Item(
            name: "Papel Higiénico",
            price: 1.75,
            image: "toilet_paper",
            weblink: "https://en.wikipedia.org/wiki/Toilet_paper",
            gradientColors: [Color(.lightGray), Color(.darkGray)]),
        Item(
            name: "Pasta Dentífrica",
            price: 0.60,
            image: "toothpaste",
            weblink: "https://en.wikipedia.org/wiki/Toothpaste",
            gradientColors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")])
    ]
    
    return i
}
