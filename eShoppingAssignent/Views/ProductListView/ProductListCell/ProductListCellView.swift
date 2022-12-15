//
//  ProductListCellView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct ProductListCellView: View {
     var product:Product
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    @State var quantityProduct: Int = 0
    var selectedItem: Product?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            AsyncImage(url: URL(string: product.imageURL ?? "NA"))
                .scaledToFill()
                .cornerRadius(10)
                .overlay(
                    FevoriteButton()
                        .padding([.top, .trailing], 5)
                    , alignment: .topTrailing
                )
                .aspectRatio(contentMode: .fit)
            Text(product.title ?? "NA")
                .font(Font.system(size: 15, weight: .regular, design: .rounded))
            Text("$\(String(format: "%.2f", product.price[0].value ?? 0))")
                .font(Font.system(size: 15, weight: .heavy, design: .rounded))
            HStack(alignment: .center, spacing: 0) {
                Button(action: {
                    if self.cart.contains(where: { (prod) -> Bool in
                        prod.id == self.product.id
                    }) {
                        self.cart.removeAll { (prod) -> Bool in
                            prod.id == self.product.id
                        }
                    } else {
                        self.cart.append(self.product)
                    }
                }){
                    if self.cart.contains(where: { (prod) -> Bool in
                        return prod.id == self.product.id
                    }) {
                        HStack(alignment: .center, spacing: 20) {
                            Image(systemName: "checkmark")
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                        .background(Color.gray)
                        .cornerRadius(10)
                    } else {
                        HStack(alignment: .center, spacing: 20) {
                            Image(systemName: "cart.fill")
                        }
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                        .background(Color(red: 111/255, green: 115/255, blue: 210/255))
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal, 0)
            .padding(.vertical, 10)
        }
        .aspectRatio(contentMode: .fit)
    }
    fileprivate func FevoriteButton() -> some View {
            return Button(action: {
                if self.favorites.contains(where: { (fav) -> Bool in
                    fav.id == self.product.id
                }) {
                    self.favorites.removeAll { (fav) -> Bool in
                        fav.id == self.product.id
                    }
                } else {
                    self.favorites.append(self.product)
                }
            }) {
                if self.favorites.contains(where: { (fav) -> Bool in
                    return  fav.id == self.product.id
                }) {
                    Image(systemName: "heart.fill")
                    .foregroundColor(Color.red)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                } else {
                    Image(systemName: "heart")
                    .foregroundColor(Color.black)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .cornerRadius(20)
            .opacity(0.9)
        }
}
    
