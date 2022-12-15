//
//  ProductDetailView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct ProductDetailView: View {
    var product:Product
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    
    @State private var showShareSheet = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18){
                HStack{
                    Text("Product Detail")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    Spacer(minLength: 0)
                }
            }
            .padding(.top, 05)
            VStack(alignment: .leading, spacing: 8){
                AsyncImage(url: URL(string: product.imageURL ?? "NA"))
                    .scaledToFill()
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title ?? "NA")
                        .font(Font.system(size: 24, weight: .semibold, design: .rounded))
                    Text("$\(String(format: "%.2f", product.price.first?.value ?? 0))")
                        .font(Font.system(size: 19, weight: .semibold, design: .rounded))
                }
                HStack {
                    HStack(alignment: .center, spacing: 0) {
                        Button(action: {
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
                               // return true
                                return fav.id == self.product.id
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
                    Spacer()
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
                                 Text("IN YOUR CART")
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
                                 Text("ADD TO CART")
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
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            Text(product.brand ?? "NA")
                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
            Divider()
            Spacer()
            VStack {
                Text("\(product.totalReviewCount ?? 0) Total review\(product.totalReviewCount == 1 ? "" : "s")")
                    .font(Font.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(Color.gray)
            }
            VStack {
                HStack {
                    Spacer()
                    RatingView(rating: self.product.ratingCount ?? 0.0, primaryColor: Color.yellow, secondaryColor: Color.gray)
                        .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                }
            }
        }
        .padding(.top, 05)
        .padding(.bottom, 70)
    }
}


