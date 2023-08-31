//
//  TrendingRepoProtocols.swift

//
//  Created by Mehmood on 16/05/2022.
//

import Foundation
import UserNotifications

protocol TrendingViewToPresenterProtocol: AnyObject{
    
    var view: TrendingPresenterToViewProtocol? {get set}
    var interactor: TrendingPresenterToInteractorProtocol? {get set}
    var router: TrendingPresenterToRouterProtocol? {get set}
    func startFetchingTrendingRepos() async

}

protocol TrendingPresenterToViewProtocol: AnyObject{
    func showTrendingRepos(repoEntArray:[TrendingModel])
    func showError()
    func notifyDataFetchedSuccessfully(notificationRequest : UNNotificationRequest)
}

protocol TrendingPresenterToRouterProtocol: AnyObject {
    static func createModule()-> TrendingViewController
    func callRetryPopupScreen(viewController : TrendingViewController)
}

protocol TrendingPresenterToInteractorProtocol: AnyObject {
    var presenter:TrendingInteractorToPresenterProtocol? {get set}
    var service : ServiceProtocol?  { get set }
    func fetchTrendingRepos() async
}

protocol TrendingInteractorToPresenterProtocol: AnyObject {
    func reposFetchedSuccess(reposModelArray:[Item])
    func reposFetchFailed()
}

