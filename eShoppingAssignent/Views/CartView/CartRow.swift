//
//  CartRow.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI


struct CartRow: View {
    
    var item:Product
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: item.imageURL ?? "NA"))
                    .scaledToFill()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            } else {
            }
            VStack(alignment: .leading, spacing: 12) {
                Text("\(item.title ?? "NA")")
                    .font(Font.system(size: 17, weight: .regular, design: .rounded))
                Text("$\(String.init(format: "%.2f", item.price.first?.value ??  0))")
                    .font(Font.system(size: 17, weight: .bold, design: .rounded))
            }
            Spacer()
        }
    }
}

