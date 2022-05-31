//
//  RequestManager.swift

//
//  Created by Mehmood on 15/05/2022.
//


import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

final class RequestManager: NSObject {
    
    // use singleton pattern
    static let shared = RequestManager()
    fileprivate override init() {}
    
    fileprivate let sessionManager: URLSession = {
        return getSession()
    }()
    
    fileprivate static func getSession() -> URLSession{
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120.0
        return URLSession(configuration: configuration)
    }
    
    func performRequest<T: Codable>(request:URLRequest,completion: @escaping (_ response: Result<T>) -> Void) {
        guard let url = request.url else {
            return
        }
        
        let task = sessionManager.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
//            print(String(data: data, encoding: .utf8)!)
            if  error != nil{
                completion(Result.failure(error!))
            }
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data){
                completion(Result.success(decodedResponse))
            }else{
                print("ERROR DECODING JSON RESPONSE")
            }
            return
        }
        task.resume()
    }
    
}

