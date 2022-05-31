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
    
    func fetchTrendingRepos() {
        self.service?.fetchTrendingRepos(completion: { result in
            
            // TODO: Un Comment following 2 lines to view Retry and user busy Lottie effect
//            self.presenter?.reposFetchFailed()
//            return
            
            switch result{
            case .success(let repos):
                self.presenter?.reposFetchedSuccess(reposModelArray: repos.items ?? [])
                break
            case .failure(_):
                self.presenter?.reposFetchFailed()
                break
           
            }
        })
        
    }
}

