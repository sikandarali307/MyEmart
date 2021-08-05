//
//  MyCollectionViewCell.swift
//  MyEmart
//
//  Created by Sikandar Ali on 05/08/2021.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var image:UIImageView!
    @IBOutlet var rateimg:UIImageView!
    @IBOutlet var titlelbl:UILabel!
    @IBOutlet var deslbl:UILabel!
    @IBOutlet var duration:UILabel!
    @IBOutlet var price:UILabel!
    @IBOutlet var ratelbl:UILabel!
    static  let id = "MyCollectionViewCell"
    static func nib()->UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        image.layer.cornerRadius = 15
        // Initialization code
    }
    public func congfig(model:RecordModel){
         self.image.image = UIImage(named: "\(model.image_name!)")
         self.titlelbl.text = model.name
     }

    
}
