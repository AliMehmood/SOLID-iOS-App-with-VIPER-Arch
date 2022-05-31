//
//  NetworkService.swift

//
//  Created by Mehmood on 16/05/2022.
//

import Foundation
//singleton class
final class NetworkService: NSObject, ServiceProtocol {
    
    let requestManager = RequestManager.shared
    static let shared = NetworkService.init()
    
    fileprivate override init() {}
    
    func fetchTrendingRepos(completion: @escaping (Result<RepositoriesResponse>) -> Void) {
        let request = RequestBuilder.shared.getRequestForTrendingRepos()
        self.requestManager.performRequest(request: request) { response in
            completion(response)
        }
    }
}

