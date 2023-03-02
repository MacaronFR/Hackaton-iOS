//
//  EntrepriseDataModel.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import Foundation

struct Entreprises: Codable {
    var id: String
    var name : String
    var siret : String
    var createdAt: String
    var updatedAt: String
    var grade: Int
    var buildings: [Batiment]
}
