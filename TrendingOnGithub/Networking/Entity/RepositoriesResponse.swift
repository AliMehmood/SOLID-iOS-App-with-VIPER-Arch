// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let repositoriesResponse = try? newJSONDecoder().decode(RepositoriesResponse.self, from: jsonData)

import Foundation

// MARK: - RepositoriesResponse
struct RepositoriesResponse: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]?
     
}
