//
//  ItemDetailView.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI
import Combine

struct ItemDetailView: View {
    var item : Item
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false)
            {
                VStack(alignment: .center, spacing: 20) {
                    ItemHeaderView(item: item)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text(item.name)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(item.gradientColors[1])
                            .multilineTextAlignment(.center)
                        
                        Text("\(String(format: "%.2f", item.price))€")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(item.gradientColors[0])
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
                .navigationBarTitle(item.name, displayMode: .inline)
                .navigationBarHidden(true)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(
                        name: "Maça",
                        price: 1,
                        image: "apple",
                        weblink: "https://en.wikipedia.org/wiki/Apple",
                        gradientColors: [Color("ColorAppleLight"), Color("ColorAppleDark")]))
    }
}
