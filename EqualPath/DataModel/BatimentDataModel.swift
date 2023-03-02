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
    var id_batiment: Int
    var nom_batiment : String
    var not_batiment : Int
    var adresse_batiment : String
    var ville : String
    var code_postal : String
    var tel : String
    var mail : String
    var id_entreprise : Entreprise
    var error: String?
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

