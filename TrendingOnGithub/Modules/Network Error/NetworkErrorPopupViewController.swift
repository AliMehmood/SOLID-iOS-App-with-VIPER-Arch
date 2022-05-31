//
//  NetworkErrorPopupViewController.swift
//  TrendingOnGithub
//
//  Created by Mehmood on 31/05/2022.
//

import UIKit
import SDWebImageLottieCoder

protocol NetworkErrorPopupViewControllerDelegate{
    func didTapRetryButton()
}

class NetworkErrorPopupViewController: UIViewController {

    @IBOutlet weak var retryButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var delegate : NetworkErrorPopupViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupRetryBtn()
        setupLottieCoder()
        setupLottieImage()
    }
    
    func setupRetryBtn (){
        self.retryButton.layer.cornerRadius = 5
        self.retryButton.layer.borderColor = UIColor.systemGreen.cgColor
        self.retryButton.layer.masksToBounds = true
        
    }
    
    func setupLottieCoder(){
        // Add lottie coder
        let lottieCoder = SDImageLottieCoder.shared
        SDImageCodersManager.shared.addCoder(lottieCoder)
        
    }
    
    func setupLottieImage(){
        let url = Bundle.main.url(forResource: "play", withExtension: "gif")
        self.imageView.sd_setImage(with: url)
    }
    
    
    @IBAction func retryDidTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegate?.didTapRetryButton()
        
    }
    
}
