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
    var id_question: Int
    var index_question : String
    var weight_question : Int
    var text_question : String
    var id_handicap : Handicap
    var error: String?
}

struct Handicap : Codable {
    var id: Int
    var nom : String
    var error: String?
}
