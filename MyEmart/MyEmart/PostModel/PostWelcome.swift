//
//  PostWelcomr.swift
//  MyEmart
//
//  Created by Sikandar Ali on 05/08/2021.
//

import Foundation
struct PostWelcome : Codable {
    let error : Bool?
    let error_msg : String?
    let records : [PostRecord]?

    enum CodingKeys: String, CodingKey {

        case error = "error"
        case error_msg = "error_msg"
        case records = "records"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent(Bool.self, forKey: .error)
        error_msg = try values.decodeIfPresent(String.self, forKey: .error_msg)
        records = try values.decodeIfPresent([PostRecord].self, forKey: .records)
    }

}
