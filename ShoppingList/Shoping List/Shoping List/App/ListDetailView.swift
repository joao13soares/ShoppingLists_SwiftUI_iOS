//
//  ListDetailView.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI
import Combine 

struct ListDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var shoppingList : ShoppingList
    @State var newItemName : String = ""
    
    @State var toggleItemsMode : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("ColorBlueberryLight").edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    List {
                        ForEach(shoppingList.items.array) { item in
                            if toggleItemsMode {
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    ItemRowView_Toggle(item: item, toggleItem: item.showInList).padding(.vertical, 4)
                                }
                            }
                            else if item.showInList {
                                NavigationLink(destination: ItemDetailView(item: item)) {
                                    ItemRowView_Stepper(item: item).padding(.vertical, 4)
                                }
                            }
                        }
                    }
                    .navigationBarTitle(shoppingList.name)
                    .toolbar(content: {
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                    self.presentationMode.wrappedValue.dismiss()
                                    toggleItemsMode = false
                                }, label: {
                                    Image(systemName: "square.and.arrow.down")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70, alignment: .trailing)
                                }
                            )
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            if !toggleItemsMode {
                                Button(action: {
                                        toggleItemsMode.toggle()
                                    }, label:{
                                            Image(systemName: "pencil")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 70, height: 70, alignment: .trailing)
                                    }
                                )
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                self.shareListInfo()
                                }, label:{
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 70, height: 70, alignment: .trailing)
                                }
                            )
                        }
                    })
                    
                }
                .onDisappear{ shoppingList.cost = shoppingList.calcCost() }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(LinearGradient(gradient: Gradient(colors: [Color("ColorBlueberryLight"), Color("ColorBlueberryDark")]), startPoint: .top, endPoint: .zero))
                .cornerRadius(0)
                .padding(.top, 1.0)
            }
            .background(Color("ColorBlueberryLight"))
        }
        .navigationBarHidden(true)
    }
    
    func shareListInfo() {
        var shareText = "\(String(format: "List: %@; Cost = %.2f", shoppingList.name, shoppingList.calcCost()))€"
        
        for item in shoppingList.items.array {
            if item.quantity > 0 {
            shareText += "\(String(format: "\n%@; Quantity: %d; Cost = %.2f", item.name, item.quantity, item.price * Float(item.quantity)))€"
            }
        }
        
        //let image = UIImage(systemName: shoppingList.image)
        
        let avc = UIActivityViewController(
            activityItems: [shareText],
            applicationActivities: nil)
    
        UIApplication.shared.windows.first?
            .rootViewController?.present(
            avc, animated: true, completion: nil)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(shoppingList: ShoppingList(name: "List"))
    }
}
	
