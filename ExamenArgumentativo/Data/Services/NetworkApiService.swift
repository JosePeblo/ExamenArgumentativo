//
//  NetworkApiService.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation
import Alamofire

class NetworkApiService {
    static let shared = NetworkApiService()
    
    func get<T: Codable>(url: URL, params: Parameters = [:]) async -> T? {
        let headers: HTTPHeaders = ["X-Api-Key": "O5wVOp21guwzkDyyF/Z7vA==kHJ0REwdmx9BS8WG"]
        let taskReq = AF.request(url, method: .get, parameters: params, headers: headers).validate()
        
        let response = await taskReq.serializingData().response
        
        
        switch response.result {
        case .success(let data):
            do {
                print(String(data: data, encoding: .ascii) ?? "no se pude pa")
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                debugPrint(error)
                return nil
            }
        case let .failure(error):
            debugPrint(error.localizedDescription)
            return nil
        }
        
    }
}

