//
//  NetworkController.swift
//  PokemonCards
//
//  Created by jekaterina.livcane on 15/09/2020.
//  Copyright © 2020 jekaterina.livcane. All rights reserved.
//

import Foundation

class NetworkController{
    
    enum HTTPMethod: String {
        case Get = "GET" // get data
        case Put = "PUT" // update data
        case Post = "POST" //send data
        case Delete = "DELETE" // delete data
    }
    static func performRequest(for url: URL,
                               httpMethod: HTTPMethod,
                               urlParameters: [String: String]? = nil ,
                               body: Data? = nil,
                               completion: ((Data?, Error?) -> Void)? = nil) {
        let requestURL = self.url(byAdding: urlParameters, to: url)
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion?(data, error)
        }
        dataTask.resume()
    }
    static func url(byAdding parameters: [String: String]?, to url: URL) ->URL{
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = parameters?.compactMap {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        guard let url = components?.url else{
            fatalError("URL componenets is nil!")
        }
        return url
    }
}
