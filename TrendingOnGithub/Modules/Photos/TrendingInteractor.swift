//
//  TrendingInteractor.swift

//
//  Created by Mehmood on 16/05/2022.
//

import Foundation

class TrendingInteractor: TrendingPresenterToInteractorProtocol{
    
    var service: ServiceProtocol?
    var presenter: TrendingInteractorToPresenterProtocol?
    
    
    
    init(presenter: TrendingInteractorToPresenterProtocol?, service : ServiceProtocol?){
        self.presenter = presenter
        self.service = service
    }
    
    func fetchTrendingRepos() async {
        
        let result = await self.service?.fetchTrendingRepos()
        switch result{
        case .success(let repos):
            self.presenter?.reposFetchedSuccess(reposModelArray: repos.items ?? [])
            break
        case .failure(_), .none:
            self.presenter?.reposFetchFailed()
            break
            
        }
    }
}

