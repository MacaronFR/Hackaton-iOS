//
//  ReponseDataModel.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import Foundation

struct Reponse : Codable {
    var id_response : Int
    var not_reponse : Int
    var id_question : Question
    var id_batiment : Batiment
    var error: String?
}

struct Question : Codable {
    var id: String
    var text : String
    var weight : String
    var createdAt: String
    var updatedAt: String
}

struct Handicap : Codable {
    var id: Int
    var nom : String
    var error: String?
}
