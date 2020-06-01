import Foundation

struct Video: Codable, Hashable {

    // MARK: - Properties

    let id: Int
    let name: String
    let thumbnail: String
    let videoDescription: String
    let videoLink: String

    // MARK: - Hashing Method

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - Coding Keys

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case videoDescription = "description"
        case videoLink = "video_link"
    }
}

