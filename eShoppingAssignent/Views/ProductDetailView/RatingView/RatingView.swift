//
//  RatingView.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//


import SwiftUI

struct RatingView: View {
    
    @State var rating:Double
    @State var primaryColor:Color
    @State var secondaryColor:Color
    
    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            ForEach(0..<5) { x in
                if self.rating > Double(x) {
                    if self.rating < Double(x) + 1 {
                        Image(systemName: "star.lefthalf.fill")
                        .foregroundColor(self.primaryColor)
                    } else {
                        Image(systemName: "star.fill")
                        .foregroundColor(self.primaryColor)
                    }
                } else {
                    Image(systemName: "star")
                        .foregroundColor(self.secondaryColor)
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var rating:Double = 3.7
    static var primary:Color = Color.yellow
    static var secondary:Color = Color.gray
    static var previews: some View {
        RatingView(rating: rating, primaryColor: primary, secondaryColor: secondary)
    }
}
