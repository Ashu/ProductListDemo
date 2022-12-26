//
//  APIHandler.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import Foundation

protocol RequestHandler {
    associatedtype RequestDataType
    func makeRequest(from data: RequestDataType) throws -> Request
}

protocol ResponseHandler {
    associatedtype ResponseDataType
    func parseResponse(data: Data) throws -> ResponseDataType
}

typealias APIHandler = RequestHandler & ResponseHandler

//MARK: - Request
class Request {
    private var request: URLRequest
    
    init(urlRequest: URLRequest) {
        self.request = urlRequest
    }
    
    var urlRequest: URLRequest {
        return request
    }
}

//MARK: - Response
protocol Response: Codable {
    var httpStatus: Int { set get }
}

//MARK: - Errors
struct NetworkError: Error {
    let message: String
}
