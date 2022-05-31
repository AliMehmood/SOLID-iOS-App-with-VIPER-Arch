//
//  DBService.swift

//
//  Created by Mehmood on 18/05/2022.
//

import Foundation
//singleton class
final class DBService: NSObject, ServiceProtocol {
    
    static let shared = DBService.init()
    
    fileprivate override init() {}
    
    
    
    public func fetchTrendingRepos(completion: @escaping (_ result: Result<RepositoriesResponse>)->Void){
    }
}
