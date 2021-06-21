//
//  ItemRowView.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI
import Combine

struct ItemRowView_Toggle: View {
    
    // MARK: - Properties
    @ObservedObject var item : Item
    @State var toggleItem : Bool
    
    // MARK: - body
    var body: some View {
        HStack(spacing: 20) {
            Image(item.image)
                .applyEffects(gradientColors: item.gradientColors)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                HStack(spacing: 10) {
                    Text(String(format: "x%d", item.quantity))
                        .lineLimit(1)
                    
                    Text("\(String(format: "%.2f", item.price * Float(item.quantity)))€")
                        .lineLimit(1)
                }
            }
            
            Toggle(isOn: $toggleItem) {
            }
            .toggleStyle(SwitchToggleStyle(tint: item.gradientColors[1]))
        }
        .onDisappear {
            item.showInList = toggleItem
            
            if !toggleItem {
                item.quantity = 0
            }
        }
    }
}

struct ItemRowView_Toggle_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView_Toggle(item: Item(
                            name: "Maça",
                            price: 1,
                            image: "apple",
                            weblink: "https://en.wikipedia.org/wiki/Apple",
                            gradientColors: [Color("ColorAppleLight"), Color("ColorAppleDark")]), toggleItem: true)
            .previewLayout(.sizeThatFits)
    }
}
