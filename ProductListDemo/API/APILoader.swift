//
//  APILoader.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import Foundation

class APILoader<Test: APIHandler> {
    let apiRequest: Test
    let urlSession: URLSession
    let reachibility: Reachability
    
    init(apiRequest: Test, urlSession: URLSession = .shared, reachibility: Reachability = Reachability()!) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
        self.reachibility = reachibility
    }
    
    func loadAPIRequest(requestData: Test.RequestDataType,
                        completionHandler: @escaping (Test.ResponseDataType?, Error?) -> ()) {
        if reachibility.connection == .none {
            return completionHandler(nil, NetworkError(message: "No Internet Connection"))
        }

        do {
            //create the url request
            let urlRequest = try apiRequest.makeRequest(from: requestData).urlRequest

            //call the API
            urlSession.dataTask(with: urlRequest) { data, response, error in
                guard let data = data else { return completionHandler(nil, error) }
                //parse response
                do {
                    let parsedResponse = try self.apiRequest.parseResponse(data: data)
                    return completionHandler(parsedResponse, nil)
                } catch {
                    return completionHandler(nil, error)
                }
            }.resume()
        }
        catch {
            return completionHandler(nil, nil)
        }
    }
}
