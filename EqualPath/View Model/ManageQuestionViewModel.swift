//
// Created by macaron on 02/03/2023.
//

import Foundation

class ManageQuestionViewModel: ObservableObject {
    let urlApi = ApiService()

    func returnListQuestion(id: String, completion: @escaping (Result<[Question], Error>) -> Void) {
        let urlString = urlApi.baseUrl + "/questions?buildingId=\(id)"
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
                let entreprise = try JSONDecoder().decode([Question].self, from: data)
                completion(.success(entreprise))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    func sendResponse(questionId: String, buildingId: String, note: Int) -> Bool{
        let urlString = urlApi.baseUrl + "/questions/answer/\(questionId)"
        guard let url = URL(string: urlString) else {
            return false
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONEncoder().encode(Response(note: note, buildingId: buildingId)) else { return false }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        NSLog(error.localizedDescription)
                    }
            if let response = response as? HTTPURLResponse {
                if(response.statusCode == 200){
                    return
                }else {
                    return
                }
            }else {
                return
            }
        }.resume()
        return true
    }

    func sendMail(id: String){
        let urlString = urlApi.baseUrl + "/resources/email?buildingId=\(id)"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url).resume()
    }
}
