//
//  ApiManager.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 19/10/23.
//

import Foundation
import AVFoundation

struct Response<T> {
    var model: T?
    var isSuccess: Bool = false
    var errorMsg: String?
    var code: Int?
    var totalPages : Int?
}

class ApiManager {
    typealias RequestCompletionBlock = (Data?, URLResponse?, Error?) -> Void
    static let sharedManager = ApiManager()
    private init() {}
    
    func getURLRequest(path: String) -> URLRequest {
        var request = URLRequest(url: URL(string: path)!)
        request.httpMethod = "GET"
        return request
    }
    
    func getReponse<T: Codable>(request: URLRequest, reponseModelType: T.Type, completion: @escaping (_ response: Response<T>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error as NSError? {
                let response = Response<T>(model: nil, isSuccess: false, errorMsg: error.localizedDescription, code: error.code)
                completion(response)
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200 ... 299:
                    if let responseModel = self.parseData(data, modelType: reponseModelType) {
                        let response = Response<T>(model: responseModel, isSuccess: true, errorMsg: nil, code: httpResponse.statusCode)
                        completion(response)
                    } else {
                        let response = Response<T>(model: nil, isSuccess: false, errorMsg: "Couldn't parse", code: httpResponse.statusCode)
                        completion(response)
                    }
                default:
                    print("any default parsing")
                }
            } else {
                let response = Response<T>(model: nil, isSuccess: false, errorMsg: "Response is missing", code: 400)
                completion(response)
            }
        }
        dataTask.resume()
    }
    
    //used to parse data into model
    private func parseData<T: Codable>(_ data: Data?, modelType _: T.Type) -> T? {
        guard let data = data else {
            return nil
        }
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            print("Unknown parsing error: \(error)")
        }
        return nil
    }
}
