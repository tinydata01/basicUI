import Foundation

class DataService{
    static let shared = DataService()
    fileprivate let baseURLString = "https://api.github.com"
    func fetchData(completion: @escaping (Result<[Welcome],Error>)-> Void){
        guard let path = Bundle.main.path(forResource:"source-and-destination", ofType:"json") else {return}
        let url = URL(fileURLWithPath:path)
        do{
            let data = try Data(contentsOf:url)
                //let json = try JSONSerialization.jsonObject(with: validData, options: [])
            let gists = try JSONDecoder().decode([Welcome].self, from:data)
                completion(.success(gists))
            }
            catch let serializationError{
           completion(.failure(serializationError))
            }
        }

    func fetchGists(completion: @escaping (Result<[Gist], Error>)-> Void){
        var componentURL = URLComponents()
        componentURL.scheme = "https"
        componentURL.host = "api.github.com"
        componentURL.path = "/gists/public"
        guard let validURL = componentURL.url else {
            print("URL Creation is failed")
            return
        }
        URLSession.shared.dataTask(with: validURL) { (data, response,error) in
            if let httpResponse = response as? HTTPURLResponse{
                print("API Status : \(httpResponse.statusCode)")
            }
            guard let validData = data, error == nil else {
        completion(.failure(error!))
                return
            }
              do{
                //let json = try JSONSerialization.jsonObject(with: validData, options: [])
                let gists = try JSONDecoder().decode([Gist].self, from:validData)
                completion(.success(gists))
            }
            catch let serializationError{
                completion(.failure(serializationError))
            }
        }.resume()
    }
}

