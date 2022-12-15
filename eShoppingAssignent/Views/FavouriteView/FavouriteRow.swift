//
//  FavouriteRow.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct FavouriteRow: View {
    
  private var item:Product
    var body: some View {
        HStack(spacing: 4) {
            AsyncImage(url: URL(string: item.imageURL ?? "NA"))
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 12) {
                Text("\(item.title ?? "NA")")
                    .font(Font.system(size: 17, weight: .regular, design: .rounded))
                Text("$\(String.init(format: "%.2f", item.price.first?.value ??  0))")
                    .font(Font.system(size: 17, weight: .bold, design: .rounded))
            }
            Spacer()
        }
        .padding(.vertical)
    }
}
