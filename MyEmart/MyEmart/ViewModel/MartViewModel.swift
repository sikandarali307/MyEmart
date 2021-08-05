//
//  MartViewModel.swift
//  MyEmart
//
//  Created by Sikandar Ali on 05/08/2021.
//

import Foundation
class MartViewModel{
    var record = [RecordModel]()
       weak var vc: ViewController?
func GetAllBlogData(){
    let blogurl:URL = URL(string:"https://emart.pkgadget.com/api/showMainCategory.php")!
let task = URLSession.shared.dataTask(with:blogurl ) { (data, response, error) in
      if error == nil{
        
        if let data = data {
        do {
            let UrlResponse = try JSONDecoder().decode(WelcomModel.self, from: data)
            print(UrlResponse)
            self.record.append(contentsOf: UrlResponse.records!)
            DispatchQueue.main.async {
                self.vc?.MartTableview.reloadData()
            }
            
           } catch let err  {
              print(err.localizedDescription)
                            }
                      }
               
      }else {
        print(error!.localizedDescription)
        
           }
  
}

task.resume()
}
    
}
