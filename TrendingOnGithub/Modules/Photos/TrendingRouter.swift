//
//  TrendingRouter.swift

//
//  Created by Mehmood on 16/05/2022.
//

import Foundation
import UIKit

class TrendingRouter : TrendingPresenterToRouterProtocol{
    static var mainstoryboard : UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
       
    static func createModule() -> TrendingViewController {
        
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "TrendingViewController") as! TrendingViewController
        
        let presenter: TrendingViewToPresenterProtocol & TrendingInteractorToPresenterProtocol = TrendingPresenter()
        let service : ServiceProtocol = NetworkService.shared
        let interactor: TrendingPresenterToInteractorProtocol = TrendingInteractor(presenter: presenter, service: service)
        let router : TrendingPresenterToRouterProtocol = TrendingRouter()
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        
        view.presentor = presenter
        return view
        
    }
    
    
    func callRetryPopupScreen(viewController : TrendingViewController){
        let vc = TrendingRouter.mainstoryboard.instantiateViewController(withIdentifier: "NetworkErrorPopupViewController") as! NetworkErrorPopupViewController
        vc.modalPresentationStyle = .popover
        vc.delegate = viewController
        viewController.navigationController?.present(vc, animated: true, completion: nil)
        
    }
    
}
