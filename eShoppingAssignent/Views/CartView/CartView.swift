//
//  CartView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var cartViewModels = CartViewModel()
    @Binding var items:[Product]
    @Binding var cartViewModel:[Product]
    @State private var isEditing:Bool = false
    @State var isHideLoader: Bool = true

    var cartTotal:Double {
        get {
            cartViewModel.reduce(0) { (res, prod) -> Double in
                res + (prod.price.first?.value ?? 0)
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(spacing: 18){
                HStack{
                    Text("Cart")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    Spacer(minLength: 0)
                }
            }
            .padding(.top, 20)
            .padding(.horizontal)
            
            ZStack {
                VStack(alignment: .center, spacing: 4) {
                    Text("Your Cart")
                        .font(Font.system(size: 16, weight: .bold, design: .rounded))
                    Text("\(cartViewModel.count) Item\(cartViewModel.count == 1 ? "" : "s")")
                        .font(Font.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.gray)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isEditing = !self.isEditing
                        }
                    }) {
                        if self.isEditing {
                            Text("Done")
                            .font(Font.system(size: 16, weight: .bold, design: .rounded))
                            .padding(.trailing, 20)
                        } else {
                            Image(systemName: "ellipsis")
                            .padding(.trailing, 20)
                        }
                    }.foregroundColor(Color(red: 111/255, green: 115/255, blue: 210/255))
                }
            }
            .padding(.bottom, 10)
            ScrollView(.vertical, showsIndicators: true) {
                ActivityIndicatorView(animating: $isHideLoader, style: .large)
                ForEach(cartViewModel, id: \.id) { item in
                    HStack {
                        CartRow(item: item)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                        if self.isEditing {
                            Button(action: {
                                self.cartViewModel.removeAll { (prod) -> Bool in
                                    prod.id == item.id
                                }
                            }) {
                                Image(systemName: "trash.fill")
                                .padding(.trailing, 20)
                            }.foregroundColor(Color.red)
                        }
                    }
                }
                .onAppear {
                    cartViewModels.getCartItems()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        self.isHideLoader = false
                    }
                }
                HStack(alignment: .center, spacing: 12) {

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Total:")
                            .foregroundColor(Color.gray)
                            .font(Font.system(size: 14, weight: .semibold, design: .default))
                        Text("$\(String(format: "%.2f", cartTotal))")
                            .font(Font.system(size: 20, weight: .heavy, design: .rounded))
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                GeometryReader { geometry in
                    Button(action: {
                    }) {
                        if self.cartViewModel.count == 0 {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Cart Empty")
                                Image(systemName: "xmark")
                            }
                            .onAppear {
                               
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                                    self.isHideLoader = false
                                }
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Confirm Transaction")
                                Image(systemName: "arrow.right")
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(red: 111/255, green: 115/255, blue: 210/255))
                            .cornerRadius(10)
                        }
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


