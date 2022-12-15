//
//  ContentView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    @State var product:[Product] = []
    @State var cart:[Product] = []
    @State var favorites:[Product] = []
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isOpaque = true
    }
    
    var body: some View {
        TabBarView(images: [
            Image(systemName: "house.fill"),
            Image(systemName: "cart.fill"),
            Image(systemName: "heart.fill"),
        ], tabIndex: 0, contentTabs: [
            AnyView(ProductView(cart:  $cart, favorites: $favorites, products: $product)),
            AnyView(CartView(items: $cart, cartViewModel: $cart)),
            AnyView(FavouriteView(items: $favorites, cart:  $cart, favorites: $favorites)),
        ])
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
