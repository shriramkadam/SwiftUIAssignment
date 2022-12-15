//
//  TabBarView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//


import SwiftUI

struct TabBarView: View {

    @State var images:[Image]
    @State var tabIndex:Int
    @State var contentTabs:[AnyView]
    
    var body: some View {
        ZStack(alignment: .center) {
            ForEach(contentTabs.indices, id: \.self) { i in
                if Int(i) == self.tabIndex {
                    self.contentTabs[i]
                }
            }
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Divider()
                    HStack(alignment: .center, spacing: 0) {
                        Spacer()
                        ForEach(images.indices, id: \.self) { i in
                            if Int(i) == self.tabIndex {
                                self.images[i]
                                    .foregroundColor(Color.black)
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                            } else {
                                self.images[i]
                                    .foregroundColor(Color.gray.opacity(0.7))
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                            }
                            Spacer()
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                }
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -2)
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {

    static var images:[Image] = [
        Image(systemName: "house.fill"),
        Image(systemName: "cart.fill"),
        Image(systemName: "heart.fill"),
    ]
    static var previews: some View {
        TabBarView(images: images, tabIndex: 0, contentTabs: [
            AnyView(Text("Home")),
            AnyView(Text("Cart")),
            AnyView(Text("Favorites")),
        ])
    }
}
