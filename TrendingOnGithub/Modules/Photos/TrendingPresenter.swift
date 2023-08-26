//
//  TrendingsPresenter.swift

//
//  Created by Mehmood on 16/05/2022.
//

import Foundation

class TrendingPresenter:TrendingViewToPresenterProtocol {
    
    var view: TrendingPresenterToViewProtocol?
    
    var interactor: TrendingPresenterToInteractorProtocol?
    
    var router: TrendingPresenterToRouterProtocol?
    
    func startFetchingTrendingRepos() async {
        await self.interactor?.fetchTrendingRepos()
    }
    

}

extension TrendingPresenter: TrendingInteractorToPresenterProtocol{
    
    func reposFetchedSuccess(reposModelArray: [Item]) {
        
        var repoEntityArray : [TrendingModel] = []
        for repoObject in reposModelArray {
            
            var remarks = ""
            var repoName = ""
            var ownerName = ""
            var stargazersCount = ""
            var languageName = ""
            var ownerAvatarURL = ""
            if let rem = repoObject.description { remarks = rem }
            if let repo = repoObject.name { repoName = repo }
            if let owner = repoObject.owner?.login { ownerName = owner }
            if let stargazers = repoObject.stargazers_count { stargazersCount = "\(stargazers)" }
            if let language = repoObject.language { languageName = language }
            if let ownerAvURL = repoObject.owner?.avatar_url { ownerAvatarURL = ownerAvURL }
            
            
            let repoEntity = TrendingModel.init(remarks: remarks, ownerAvatarURL: ownerAvatarURL, repoName: repoName, ownerName: ownerName, languageColor: "", languageName: languageName, stargazersCount: stargazersCount)
            repoEntityArray.append(repoEntity)
        
        }
        self.view?.showTrendingRepos(repoEntArray: repoEntityArray)
        
    }
    
    func reposFetchFailed() {
        self.view?.showError()
    }
    
}
