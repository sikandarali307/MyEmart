//
//  PostRecord.swift
//  MyEmart
//
//  Created by Sikandar Ali on 05/08/2021.
//

import Foundation
struct PostRecord : Codable {
    let id : String?
    let name : String?
    let email : String?
    let password : String?
    let location : String?
    let timings : String?
    let thumb : String?
    let header : String?
    let sec_id : String?
    let description : String?
    let status : String?
    let role : String?
    let vendor_email : String?
    let type_id : String?
    let radius : String?
    let start_time : String?
    let end_time : String?
    let review_count : String?
    let rating : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case email = "email"
        case password = "password"
        case location = "location"
        case timings = "timings"
        case thumb = "thumb"
        case header = "header"
        case sec_id = "sec_id"
        case description = "description"
        case status = "status"
        case role = "role"
        case vendor_email = "vendor_email"
        case type_id = "type_id"
        case radius = "radius"
        case start_time = "start_time"
        case end_time = "end_time"
        case review_count = "review_count"
        case rating = "rating"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        timings = try values.decodeIfPresent(String.self, forKey: .timings)
        thumb = try values.decodeIfPresent(String.self, forKey: .thumb)
        header = try values.decodeIfPresent(String.self, forKey: .header)
        sec_id = try values.decodeIfPresent(String.self, forKey: .sec_id)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        vendor_email = try values.decodeIfPresent(String.self, forKey: .vendor_email)
        type_id = try values.decodeIfPresent(String.self, forKey: .type_id)
        radius = try values.decodeIfPresent(String.self, forKey: .radius)
        start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
        end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
        review_count = try values.decodeIfPresent(String.self, forKey: .review_count)
        rating = try values.decodeIfPresent(String.self, forKey: .rating)
    }

}
