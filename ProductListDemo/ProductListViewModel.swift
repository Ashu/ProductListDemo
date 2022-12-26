//
//  ProductListViewModel.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import Foundation

class ProductListViewModel {
    var productList: Products?
    
    private let sourcesURLString = "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328"
    
    func getData(completionHandler: @escaping () -> Void) {
        
        let apiRequest = ProductRequestAPI()
        let apiLoader = APILoader(apiRequest: apiRequest)
        apiLoader.loadAPIRequest(requestData: sourcesURLString) { data, error in
            guard let products = data else {
                completionHandler()
                return
            }
            self.productList = products
            completionHandler()
        }
        
    }
}
