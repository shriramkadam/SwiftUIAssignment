//
//  FavouriteView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//


import SwiftUI

struct FavouriteView: View {
    @StateObject var favouriteViewModel = FavouriteViewModel()
    @Binding var items:[Product]
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    @State private var isEditing:Bool = false
    @State var isHideLoader: Bool = true


    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 18){
                HStack{
                    Text("Favourite")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    Spacer(minLength: 0)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal)
            ZStack {
                if items.count == 0 {
                    VStack(alignment: .center, spacing: 4) {
                        Spacer()
                        Image(systemName: "bag.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.gray)
                            .frame(width: 40, height: 40, alignment: .center)
                            .padding(.bottom, 20)
                            .font(Font.system(size: 16, weight: .bold, design: .rounded))
                        Text("No Products To Display")
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                            self.isHideLoader = false
                        }
                    }
                    
                    .padding(.bottom, 10)
                    .navigationBarTitle("Favourite list", displayMode: .inline)
                }
            }
            .padding(.bottom, 10)
            ScrollView(.vertical, showsIndicators: true) {
                ActivityIndicatorView(animating: $isHideLoader, style: .large)
                VStack(alignment: .leading, spacing: 8){
                    ForEach(items, id: \.id) { item in
                        HStack {
                            if #available(iOS 15.0, *) {
                                ProductListCellView(product: item, cart: self.$cart, favorites: self.$favorites)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                            } else {
                            }
                        }.padding(.horizontal)
                    }
                    .onAppear {
                        favouriteViewModel.getFavouriteItems()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                            self.isHideLoader = false
                        }
                    }
                    GeometryReader { geometry in
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 20)
                .padding(.bottom, 100)
                .padding(.horizontal)
            }
        }
    }
}



