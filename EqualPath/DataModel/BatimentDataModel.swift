//
//  BatimentDataModel.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import Foundation

struct BatimentData:Codable{
    var id_batiment: Batiment
    var error: String?
}

struct Batiment : Codable {
    var id: String
    var name: String
    var address: String
    var phoneNumber: String
    var mail: String
    var createdAt: String
    var updatedAt: String
}

struct Entreprise : Codable {
    var id: Int
    var tous_les_batiment : TousLesBatiment
}

struct TousLesBatiment:Codable{
    var status: Int
    var batiment : [BatimentSelection]
    var error: String?
}

struct BatimentSelection: Codable {
    let id: Int
    let nom_batiment: String
    let ville_batiment : String
}
