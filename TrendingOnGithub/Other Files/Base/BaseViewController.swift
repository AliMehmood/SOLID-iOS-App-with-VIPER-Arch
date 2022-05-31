//
//  BaseViewController.swift

//
//  Created by Mehmood on 16/05/2022.
//

import UIKit

class BaseViewController: UIViewController {
    var myActivityIndicator : UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }

    func setupViews(){
        self.setupActivityIndicator()
    }
    
    
    func setupActivityIndicator(){
        guard let indicator = myActivityIndicator else{
            self.myActivityIndicator = UIActivityIndicatorView.init(style: .large)
            self.myActivityIndicator?.center = view.center
            self.myActivityIndicator?.hidesWhenStopped = true
            self.myActivityIndicator?.stopAnimating()
            return
        }
        view.addSubview(indicator)
        view.bringSubviewToFront(indicator)
    }
    
}
