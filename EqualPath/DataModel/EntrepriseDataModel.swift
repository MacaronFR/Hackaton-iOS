//
//  EntrepriseDataModel.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import Foundation

struct Entreprises: Codable {
    var id: Int
    var name : String
    var siret : String
    var error: String?
}
