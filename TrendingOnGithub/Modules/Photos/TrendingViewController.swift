//
//  TrendingViewController.swift

//
//  Created by Mehmood on 16/05/2022.
//

import UIKit
import UserNotifications

class TrendingViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var trendingTableView: UITableView!
    var presentor:TrendingViewToPresenterProtocol?
    fileprivate var trendingArrayList : [TrendingModel] = []

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.titleLabel.text = "Trending Repos".uppercased()
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
    }
    
    override func viewDidAppear(_ animated: Bool)  {
        Task{[weak self] in
            // MARK: Comment below line to view loading skeleton effect on tableview
            await self?.startFetchingTrendingRepos()
        }
        
        
    }
    
    func startFetchingTrendingRepos() async{
        self.myActivityIndicator?.startAnimating()
        await presentor?.startFetchingTrendingRepos()
    }
    
    override func setupViews(){
        super.setupViews()
        self.setuptrendingTableView()
    }
}
extension TrendingViewController{
    
    func setuptrendingTableView() -> Void {
        setupDelegateAndDatasource()
        setupNIBForCell()
        self.trendingTableView.allowsSelection = false
        self.trendingTableView.isScrollEnabled = true
        self.trendingTableView.estimatedRowHeight = 80
        self.trendingTableView.rowHeight = UITableView.automaticDimension
        
        
        
    }
    
    
    ///setup delegate and datasource to self VC
    func setupDelegateAndDatasource(){
        self.trendingTableView.delegate = self
        self.trendingTableView.dataSource = self
    }
    
    ///setup NIB for Cell
    func setupNIBForCell(){
        let bundle = Bundle(for: RepoTableViewCell.self)
        self.trendingTableView.register(UINib.init(nibName: "RepoTableViewCell", bundle: bundle), forCellReuseIdentifier: RepoTableViewCell.reusableCellIdentifier)
        self.trendingTableView.register(UINib.init(nibName: "LoadingSkeletonTableViewCell", bundle: bundle), forCellReuseIdentifier: LoadingSkeletonTableViewCell.reusableCellIdentifier)
    }
    
    
}

extension TrendingViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingArrayList.count == 0 ? 1 : trendingArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if trendingArrayList.count>0{
            let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.reusableCellIdentifier) as! RepoTableViewCell
            cell.bindData(repoModel: self.trendingArrayList[indexPath.row])
            return cell
        
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingSkeletonTableViewCell.reusableCellIdentifier, for: indexPath)
            return cell
        }
        
    }
    
    
    
    
}
extension TrendingViewController: UICollectionViewDelegateFlowLayout{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if trendingArrayList.count>0{
            return UITableView.automaticDimension
        }else{
            return tableView.frame.height
        }
        
    }
    
}
extension TrendingViewController : TrendingPresenterToViewProtocol{
    func showTrendingRepos(repoEntArray: [TrendingModel]) {
        self.trendingArrayList = repoEntArray
        DispatchQueue.main.async {
            
            self.myActivityIndicator?.stopAnimating()
            self.trendingTableView.reloadData()
            self.trendingTableView.layoutIfNeeded()
        }
    }
    

    func showError() {
        DispatchQueue.main.async{
            self.myActivityIndicator?.stopAnimating()
            self.presentor?.router?.callRetryPopupScreen(viewController: self)
        }
    }
    
    //MARK: Local Notification
    func notifyDataFetchedSuccessfully(notificationRequest : UNNotificationRequest){
        UNUserNotificationCenter.current().add(notificationRequest)
    }

}
extension TrendingViewController : NetworkErrorPopupViewControllerDelegate{
    
    func didTapRetryButton() async {
        await self.startFetchingTrendingRepos()
    }
    
    
}
