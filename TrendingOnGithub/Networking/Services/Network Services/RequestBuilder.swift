//  RequestBuilder.swift

//
//  Created by Mehmood on 15/05/2022.
//


import Foundation

final class RequestBuilder{

    static var shared = RequestBuilder()
    fileprivate init(){}
    
    // MARK: Custom Request
    func getRequestForTrendingRepos() -> URLRequest{
        let url = URL.init(string: Constants.URLConstants.reposAPI.rawValue)
        let request =  URLRequest.init(url: url! )
        return request
    }
    
}
