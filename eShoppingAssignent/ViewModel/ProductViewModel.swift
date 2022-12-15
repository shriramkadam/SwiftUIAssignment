//
//  ProductViewModel.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//


import Foundation
//import Combine

class ProductViewModel: ObservableObject {
    @Published var results: [Product] = []
    
  public func getAllShoppingItems()
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
