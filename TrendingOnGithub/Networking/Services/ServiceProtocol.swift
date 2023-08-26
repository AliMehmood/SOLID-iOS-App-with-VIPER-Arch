//
//  ServiceProtocol.swift

//
//  Created by Mehmood on 18/05/2022.
//

import Foundation
protocol ServiceProtocol{
    
    func fetchTrendingRepos() async -> Result<RepositoriesResponse>
}
