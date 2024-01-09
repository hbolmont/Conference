import Foundation

struct Profile: Identifiable, Decodable {
    let id: Int
    let image: String
    let name: String
}
