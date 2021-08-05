//
//  SecondViewController.swift
//  MyEmart
//
//  Created by Sikandar Ali on 06/08/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textviewself: UITextView!
    var email : String = ""
    var location: String  = ""
    var id : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
     setupPostMethod(email: email, location: location, id: id)
        // Do any additional setup after loading the view.
    }
    

     
    func setupPostMethod(email:String,location:String,id:String){
 
        if let url = URL(string: "https://emart.pkgadget.com/api/showVendors.php"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
         
            let parameters: [String : Any] = [
                "email": email,
                "location" : location,
                "type_id":id
            ]

            request.httpBody = parameters.percentEscaped().data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard  let data = data else {
                    if error == nil{
                        print(error?.localizedDescription ?? "Unknown Error")
                    }
                    return
                }
                
                if let response = response as? HTTPURLResponse{
                    guard (200 ... 299) ~= response.statusCode else {
                        print("Status code :- \(response.statusCode)")
                        print(response)
                        return
                    }
                }
                
                do{
                  
                       let jsondata = try JSONSerialization.jsonObject(with: data, options: [])
                    DispatchQueue.main.async {
                      print(jsondata)
                       // self.textviewself.text = jsondata as? String
                       let jsonObject = jsondata as! [String: Any]
                       

                        let email         = jsonObject["email"]       as? String
                        let rating        = jsonObject["rating"]        as? Double
                        let descrition    = jsonObject["description"]      as? String
                        let id            = jsonObject["id"]          as? String
                        let password      = jsonObject["password"]    as? Int
                        let radius        = jsonObject["radius"]  as? Int
                        let stuts         = jsonObject["status"]      as? Int
                        let vemail        = jsonObject["vender_email"]   as? String
 
                        
                      }
 
                }catch let error{
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }

}

extension  String   {
    public var convertHtmlToNSAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }

    public func convertHtmlToAttributedStringWithCSS(font: UIFont? , csscolor: String , lineheight: Int, csstextalign: String) -> NSAttributedString? {
        guard let font = font else {
            return convertHtmlToNSAttributedString
        }
        let modifiedString = "<style>body{font-family: '\(font.fontName)'; font-size:\(font.pointSize)px; color: \(csscolor); line-height: \(lineheight)px; text-align: \(csstextalign); }</style>\(self)";
        guard let data = modifiedString.data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error)
            return nil
        }
    }
}


extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
