//
//  ItemHeaderView.swift
//  Shoping List
//
//  Created by Utilizador convidado on 12/06/2021.
//

import SwiftUI

struct ItemHeaderView: View {
    var item : Item
    
    @State private var isAnimating : Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: item.gradientColors), startPoint: .topLeading, endPoint: .trailing)
            
            Link(destination: URL(string: item.weblink)!, label: {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 15, x: 8, y: 8)
                    .padding(50)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
            })
        }
        .frame(height: 440)
        .onAppear() {
            withAnimation(.easeOut(duration: 1)) {
                isAnimating = true
            }
            
        }
    }
}

struct ItemHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ItemHeaderView(item: Item(
                        name: "Maça",
                        price: 1,
                        image: "apple",
                        weblink: "https://en.wikipedia.org/wiki/Apple",
                        gradientColors: [Color("ColorAppleLight"), Color("ColorAppleDark")]))
            .previewLayout(.sizeThatFits)
    }
}
