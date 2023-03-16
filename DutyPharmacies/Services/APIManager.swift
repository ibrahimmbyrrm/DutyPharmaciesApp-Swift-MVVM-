//
//  APIManager.swift
//  DutyPharmacies
//
//  Created by İbrahim Bayram on 16.03.2023.
//

import Foundation

class APIManager : APIService {

    func fetchPharmacies(city : String ,completion : @escaping(Result<[Pharmacy], Error>)->Void) {
        let headers = [
          "content-type": "application/json",
          "authorization": "apikey 7xbu93cNyXDOY9K18Wyysj:2UCmhys0MV8GPXdpzBeENn"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/health/dutyPharmacy?ilce=&il=\(city)")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
            print(error)
          } else {
              do {
                  let jsonData = try? JSONDecoder().decode(InitialData.self, from: data!)
                  guard let jsonData = jsonData else {return}
                  print(jsonData.result[0].loc)
                  completion(.success(jsonData.result))
              }
          }
        })

        dataTask.resume()
    }
}
