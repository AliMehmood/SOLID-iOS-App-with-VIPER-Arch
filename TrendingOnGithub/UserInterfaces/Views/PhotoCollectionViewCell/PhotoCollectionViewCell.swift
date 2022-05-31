//
//  PhotoCollectionViewCell.swift
//  Case Study
//
//  Created by Mehmood on 15/05/2022.
//

import UIKit

import SDWebImageLottieCoder


class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView : UIImageView!
    static let reusableCellIdentifier = "PhotoCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Add lottie coder
        let lottieCoder = SDImageLottieCoder.shared
        SDImageCodersManager.shared.addCoder(lottieCoder)
        self.photoImageView.contentMode = .scaleAspectFill
    }
    
    func bindData(_withImage imageUrlString : String){
        let imageURL = URL.init(string: imageUrlString)
        
        // Lottie json loading
//        guard let lottieURL: URL = URL.init(string: Constants.URLConstants.loadingShimmerLottie.rawValue) else{
//            return
//        }
        photoImageView.backgroundColor = .black
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
        photoImageView.sd_setImage(with: imageURL)
//        if imageURL != nil{
//            photoImageView.sd_setImage(with: imageURL)
//        }else{
//            photoImageView.sd_setImage(with: lottieURL)
//        }
        
        
    }
    

}
