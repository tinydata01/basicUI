import Foundation

struct Welcome: Codable {

    let source, destination: [Destination]

}



// MARK: - Destination

struct Destination: Codable {

    let port, portCode: String

}



struct Gist:Codable {



    var id:String

    var isPublic : Bool

    var description: String

    enum CodingKeys: String, CodingKey {

        case id,description, isPublic = "public"

    }



    init(from decoder:Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)

    self.id = try container.decode(String.self, forKey: .id)

    self.isPublic = try container.decode(Bool.self, forKey: .isPublic)

    self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? "Description is nil"



}



}
