//
//  FeaturedCollectionViewCell.swift
//  MyEmart
//
//  Created by Sikandar Ali on 05/08/2021.
//

import UIKit

class FeaturedCollectionViewCell: UICollectionViewCell {
    @IBOutlet var image1:UIImageView!
    @IBOutlet var rateimg1:UIImageView!
    @IBOutlet var titlelbl1:UILabel!
    @IBOutlet var deslbl1:UILabel!
    @IBOutlet var duration1:UILabel!
    @IBOutlet var price1:UILabel!
    @IBOutlet var ratelbl1:UILabel!
    static  let id = "MyCollectionViewCell"
    static func nib()->UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
