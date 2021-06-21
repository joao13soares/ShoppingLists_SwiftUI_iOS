//
//  ItemRowView.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI
import Combine

struct ItemRowView_Stepper: View {
    
    // MARK: - Properties
    @ObservedObject var item : Item
    
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
            .padding(10)
            
            Stepper(onIncrement: incrementStep,
                    onDecrement: decrementStep) {
            }
        }
    }
    
    func incrementStep() {
        item.quantity += 1
    }

    func decrementStep() {
        if item.quantity > 0 {
            item.quantity -= 1
        }
    }
}

struct ItemRowView_Stepper_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView_Stepper(item: Item(
                                name: "Banana",
                                price: 1,
                                image: "apple",
                                weblink: "https://en.wikipedia.org/wiki/Apple",
                                gradientColors: [Color("ColorAppleLight"), Color("ColorAppleDark")]))
            .previewLayout(.sizeThatFits)
    }
}
