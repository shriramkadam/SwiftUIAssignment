//
//  ProductsResource.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//

import Foundation
 struct ProductsResource {
    
   public func getAllProducts(productsRequest: ProductsRequest, completion: @escaping(_ result : ShoppingItem?) -> Void) {
        let httpUtility = HttpUtility()
        let employeeEndpoint: String = "\(ApiEndpoints.shoppingPruducts)"
        if let requestUrl = URL(string: employeeEndpoint){
            httpUtility.getApiData(requestUrl: requestUrl, resultType: ShoppingItem.self) { (productsApiResponse) in
                _ = completion(productsApiResponse)
            }
        }
        
        
    }
}
