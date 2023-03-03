//
//  ReponseDataModel.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import Foundation

struct Question : Codable {
    var id: String
    var text : String
    var weight : Int
    var createdAt: String
    var updatedAt: String
    var garde: Int?
}

struct Response: Codable {
    var note: Int
    var buildingId: String
}
