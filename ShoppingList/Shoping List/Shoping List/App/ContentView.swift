//
//  ContentView.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var lists : ShoppingLists
    @State var newListName : String = ""
    
    var newListBar : some View {
        HStack {
            TextField("New list name", text: self.$newListName)
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .bold, design: .default))
                
            Button(action: self.addNewList, label: {
                Image(systemName:"cart.fill.badge.plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .trailing)
                    .colorInvert()
            })
            .padding(.trailing)
        }
    }
    
    func addNewList() {
        if newListName != "" {
            lists.array.append(ShoppingList(name: newListName))
            self.newListName = ""
        }
    }
    
    func updateListsCosts() {
        for shoppingList in lists.array {
            shoppingList.cost = shoppingList.calcCost()
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorBlueberryLight").edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    newListBar.padding([.top, .leading, .bottom], 20.0)
                    List {
                        ForEach(self.lists.array) { shoppingList in
                            NavigationLink(destination: ListDetailView(shoppingList: shoppingList)) {
                                ListRowView(shoppingList: shoppingList).padding(.vertical, 4)
                            }
                        }
                        .onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                    }
                    .navigationBarTitle("Shopping Lists")
                    .navigationBarItems(trailing: EditButton())
                }
                .onAppear{ updateListsCosts() }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color("ColorBlueberryLight"))
                .cornerRadius(0)
                .padding(.all, 0.0)
            }

        }
        .navigationBarHidden(true)
        .accentColor(.black)
        
    }
    
    func move(from source : IndexSet, to destination : Int) {
        lists.array.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        lists.array.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(lists: ShoppingLists())
        }
    }
}
