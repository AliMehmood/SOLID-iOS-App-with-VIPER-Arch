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
    
    func performRequest<T: Codable>(request:URLRequest) async -> Result<T>{
        guard let url = request.url else {
            return Result.failure(URLError.init(.badURL))
        }
        do{
            let (data, _) = try await sessionManager.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data){
                return Result.success(decodedResponse)
            }else{
                print("ERROR DECODING JSON RESPONSE")
                return Result.failure(URLError.init(.cannotDecodeRawData))
            }
            
        }catch {
            debugPrint("data could not be fetched, with error: " + error.localizedDescription)
            return Result.failure(error)
        }
        
    }
    
}

