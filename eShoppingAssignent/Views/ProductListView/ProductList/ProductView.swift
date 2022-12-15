//
//  ProductView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct ProductView: View {
    
    @StateObject var productViewModel = ProductViewModel()
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    @Binding var products:[Product]
    @State var isHideLoader: Bool = true
    
    var body: some View {
        
        VStack {
                NavigationView {
                    HStack(alignment: .top, spacing: 10) {
                        List {
                            ActivityIndicatorView(animating: $isHideLoader, style: .large)
                            ForEach(productViewModel.results, id: \.id) { product in
                                NavigationLink(destination:
                                                ProductDetailView(product: product, cart: self.$cart, favorites: self.$favorites)
                                    .padding(.horizontal, 16)
                                ) {
                                    ProductListCellView(product: product, cart: self.$cart, favorites: self.$favorites)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }.background(Color.clear)
                    }
                    .navigationBarTitle(Text("Product List"))
                    .padding(.vertical)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    .onAppear {
                        productViewModel.getAllShoppingItems()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            self.isHideLoader = false
                        }
                    }
                }
        }.refreshable {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0){
                productViewModel.getAllShoppingItems()
                self.isHideLoader = false
            }
        }
    }
}
