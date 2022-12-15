//
//  CartViewModel.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 14/12/22.

import Foundation
//import Combine

class CartViewModel: ObservableObject {
    @Published var results: [Product] = []
    
  public func getCartItems()
    {
        let productRequest = ProductsRequest()
        let productsResource = ProductsResource()
        productsResource.getAllProducts(productsRequest: productRequest) { (productApiResponse) in
            debugPrint("All Products data: \(String(describing: productApiResponse))")
            DispatchQueue.main.async { [weak self] in
                self?.results = productApiResponse?.products ?? []
            }
        }
    }
}
