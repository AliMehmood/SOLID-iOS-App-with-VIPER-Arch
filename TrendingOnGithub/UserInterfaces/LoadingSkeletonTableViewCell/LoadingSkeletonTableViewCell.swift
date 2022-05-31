//
//  LoadingSkeletonTableViewCell.swift
//  TrendingOnGithub
//
//  Created by Mehmood on 31/05/2022.
//

import UIKit
import SDWebImageLottieCoder
class LoadingSkeletonTableViewCell: UITableViewCell {

    @IBOutlet weak var loadingImageView: UIImageView!
    static let reusableCellIdentifier = "LoadingSkeletonTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Add lottie coder
        let lottieCoder = SDImageLottieCoder.shared
        SDImageCodersManager.shared.addCoder(lottieCoder)
        
        self.loadingImageView.contentMode = .scaleAspectFill
        let url = Bundle.main.url(forResource: "skeleton-loading", withExtension: "gif")
        self.loadingImageView.sd_setImage(with: url)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
