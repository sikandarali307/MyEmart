//
//  MyTableViewCell.swift
//  MyEmart
//
//  Created by Sikandar Ali on 05/08/2021.
//

import UIKit
typealias DidselectClosure = (()->Void)
class MyTableViewCell:  UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var didselectClosure :DidselectClosure?
     
    static  let id = "MyTableViewCell"
    static func nib()->UINib{
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    var mmodel = [RecordModel]()
    var index : Int?
    @IBOutlet var Collectionview: UICollectionView!
    public func configtable(model:[RecordModel]){
        self.mmodel = model
        Collectionview.reloadData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        Collectionview.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.id)
        // Initialization code
        Collectionview.delegate = self
        Collectionview.dataSource = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mmodel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = Collectionview.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        cell.congfig(model: mmodel[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 290)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
//     let vv = UIStoryboard(name: "Main", bundle: nil)
//       let vc =  vv.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
//        vc.email = "aslam@gmail.com"
//        vc.location = "33.649346,73.079227"
//        vc.id = "1"
        
        didselectClosure?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
