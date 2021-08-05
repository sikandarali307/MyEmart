//
//  ViewController.swift
//  MyEmart
//
//  Created by Sikandar Ali on 05/08/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource   , UITableViewDelegate{
    
    var SectionArr = ["Features","Mosslty Rated","Deals","SuperDeals","All Restaurants"]
     
    @IBOutlet weak var SearchBarOutlet: UISearchBar!
    @IBOutlet weak var SearchBtn: UIButton!
    @IBOutlet weak var MartTableview: UITableView!
    var martviewmobel = MartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBtn.layer.cornerRadius  = 15
        martviewmobel.vc = self
        martviewmobel.GetAllBlogData()
        MartTableview.register(MyTableViewCell.nib(), forCellReuseIdentifier: MyTableViewCell.id)
        MartTableview.dataSource = self
        MartTableview.delegate = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return martviewmobel.record.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MartTableview.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as! MyTableViewCell
        cell.configtable(model: martviewmobel.record)
        cell.didselectClosure = {
            let vv = UIStoryboard(name: "Main", bundle: nil)
                  let vc =  vv.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
                   vc.email = "aslam@gmail.com"
                   vc.location = "33.649346,73.079227"
                   vc.id = "1"
            self.present(vc, animated: true, completion: nil)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view1 = UIView(frame: CGRect(x: 0, y: 0, width: MartTableview.frame.width, height: 40))
        view1.backgroundColor = .lightGray
        let lbl1 = UILabel(frame: CGRect(x: 15, y: 0, width: view1.frame.width - 20, height: 40))
        lbl1.text  = SectionArr[section]
        view1.addSubview(lbl1)
        return view1
    }
}

