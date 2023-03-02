//
//  ManageEntrepriseViewModel.swift
//  EqualPath
//
//  Created by Maaz TAGELDIN on 02/03/2023.
//

import Foundation

class ManageEntrepriseViewModel: ObservableObject {
    let urlApi = ApiService()
    
    func returnListEntreprise(completion: @escaping (Result<[Entreprises], Error>) -> Void) {
        let urlString = urlApi.baseUrl + "/companies"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(NSError(domain: "Invalid response", code: 0, userInfo: nil)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            do {
                let entreprise = try JSONDecoder().decode([Entreprises].self, from: data)
                completion(.success(entreprise))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
