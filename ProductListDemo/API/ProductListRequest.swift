//
//  ProductListRequest.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import Foundation

struct ProductRequestAPI: APIHandler {
    
    typealias ResponseDataType = Products
    
    func makeRequest(from data: String) throws -> Request {
        guard data != "" else {
            throw ProductListRequestError.invalidURLString
        }
        
        guard let validURL = URL(string: data) else {
            throw ProductListRequestError.invalidURL
        }
        
        let request = Request(urlRequest: URLRequest(url: validURL))
        return request
    }
    
    func parseResponse(data: Data) throws -> Products {
            
        let jsonDecoder = JSONDecoder()
        
        let products = try! jsonDecoder.decode(Products.self, from: data)
        
        return products
    }
}
