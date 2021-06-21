//
//  ListRowView.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI
import Combine

extension Image {
    func applyEffects(gradientColors: [Color]) -> some View  {
        return self.renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80, alignment: .center)
            .shadow(color: Color(red:0,green:0,blue:0,opacity: 0.3),
                    radius: 3, x: 2, y: 2)
            .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(8)
    }
    func applyEffectsWithColorInvert(gradientColors: [Color]) -> some View  {
        return self.renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80, alignment: .center)
            .shadow(color: Color(red:0,green:0,blue:0,opacity: 0.3),
                    radius: 3, x: 2, y: 2)
            .colorInvert()
            .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(8)
    }
}

struct ListRowView: View {
    
    // MARK: - Properties
    @ObservedObject var shoppingList : ShoppingList
    
    // MARK: - body
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: shoppingList.image)
                .applyEffectsWithColorInvert(gradientColors: shoppingList.gradientColors)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(shoppingList.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("\(String(format: "%.2f", shoppingList.cost))€")
            }
        }
        
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(shoppingList: ShoppingList(name: "List Name"))
            .previewLayout(.sizeThatFits)
    }
}
