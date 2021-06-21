//
//  Shoping_ListApp.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI

@main
struct Shoping_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(lists: ShoppingLists())
            //ListDetailView(shoppingList: ShoppingList(name: "lista"))
        }
    }
}
