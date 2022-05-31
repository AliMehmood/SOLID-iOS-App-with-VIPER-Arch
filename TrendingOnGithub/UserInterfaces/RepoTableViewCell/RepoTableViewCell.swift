//
//  RepoTableViewCell.swift
//  TrendingOnGithub
//
//  Created by Mehmood on 21/05/2022.
//

import UIKit
import SDWebImageLottieCoder


class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var ownerId: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var remarks: UILabel!
    @IBOutlet weak var languageColor: UILabel!
    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var starCountLabel: UILabel!
    
    
    static let reusableCellIdentifier = "RepoTableViewCell"

    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        // Add lottie coder
        let lottieCoder = SDImageLottieCoder.shared
        SDImageCodersManager.shared.addCoder(lottieCoder)
        
        self.userImageView.contentMode = .scaleAspectFill
        
        self.languageColor.backgroundColor = .blue
        self.languageColor.layer.cornerRadius = self.languageColor.frame.width/2
        self.languageColor.layer.masksToBounds = true
        
        self.starImage.image = UIImage.init(named: "star")
        
        
    }
    
    func bindData(repoModel : TrendingModel?)
    {
        
        if repoModel != nil{
            let imageURL = URL.init(string: repoModel?.ownerAvatarURL ?? "")
            
            userImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            userImageView.sd_setImage(with: imageURL)
            if let remarks = repoModel?.remarks { self.remarks.text = remarks }
            if let repoName = repoModel?.repoName { self.repoName.text = repoName }
            if let ownerName = repoModel?.ownerName { self.ownerId.text = ownerName }
            if let stargazersCount = repoModel?.stargazersCount { self.starCountLabel.text = stargazersCount }
            if let languageName = repoModel?.languageName { self.languageName.text = languageName }
                    
        }
        else{
            
        }
        
        
        
        
    }
    

}
