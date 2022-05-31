//
//  TrendingRouterTests.swift
//  TrendingOnGithubTests
//
//  Created by Mehmood on 31/05/2022.
//

import XCTest
@testable import TrendingOnGithub
class TrendingRouterTests: XCTestCase {
    
    
    
    func testReferencesAfterCreateModuleCalled(){
        
        let photos = TrendingRouter.createModule()
//        Test all these
//        presenter.view = view
//        presenter.router = router
//        presenter.interactor = interactor
//        interactor.presenter = presenter
        
        //checking for both presenters
        let mockInteractor = MockTrendingInteractor.init(presenter: photos.presentor as? TrendingInteractorToPresenterProtocol, service: NetworkService.shared)
        let isBothPresentersSame = mockInteractor.presenter === photos.presentor.self
        XCTAssertEqual(isBothPresentersSame, true)
        
        
        XCTAssertNotNil(photos.presentor)
        XCTAssertNotNil(photos.presentor?.interactor)
        XCTAssertNotNil(photos.presentor?.router)
        XCTAssertNotNil(photos.presentor?.view)
        
        
        
        
    }
    

}
