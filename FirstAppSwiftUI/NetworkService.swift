//
//  Туе.swift
//  FirstAppSwiftUI
//
//  Created by Александр Харлампов on 11.12.2023.
//

import Foundation

//final class NetworkService {
//    func fetchData(completion: @escaping (Result<NewsBaseModel, Error>) -> ()) {
//        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?lang=&fields=title,body_text,images&text_format=plain&location=msk&actual_only=true") else {return}
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data else {
//                return
//            }
//            let decoder = JSONDecoder()
//            do{
//                let newsData = try decoder.decode( NewsBaseModel.self, from: data)
//                completion(.success(newsData))
//            }catch{
//                completion(.failure(Error.self as! Error))
//            }
//        }.resume()
//    }
//}
final class NetworkService {
    private let session = URLSession.shared
    
    func getNews(completion: @escaping ([News]) -> Void) {
        guard let url = URL(string: "https://kudago.com/public-api/v1.4/news/?lang=&fields=publication_date,title,body_text&text_format=text&location=msk&actual_only=true") else {
            return
        }
        
        session.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            
            do {
                let newsBaseModel = try JSONDecoder().decode(NewsBaseModel.self, from: data)
                completion(newsBaseModel.results)
            } catch {
                print(error)
            }
        }.resume()
    }
}

