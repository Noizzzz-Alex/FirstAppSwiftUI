//
//  NewwBaseModel.swift
//  FirstAppSwiftUI
//
//  Created by Александр Харлампов on 11.12.2023.
//

import Foundation

struct NewsBaseModel: Decodable {
    let results: [News]
}
struct News: Decodable {
    let publicationDate: UInt
    let title: String
    let bodyText: String
    
    enum CodingKeys: String, CodingKey {
        case publicationDate = "publication_date"
        case title
        case bodyText = "body_text"
    }
}

