// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let owner = try? newJSONDecoder().decode(Owner.self, from: jsonData)

import Foundation

// MARK: - Owner
struct Owner: Codable {
    let login : String?
    let id : Int?
    let node_id : String?
    let avatar_url : String?
    let gravatar_id : String?
    let url : String?
    let html_url : String?
    let followers_url : String?
    let following_url : String?
    let gists_url : String?
    let starred_url : String?
    let subscriptions_url : String?
    let organizations_url : String?
    let repos_url : String?
    let events_url : String?
    let received_events_url : String?
    let type : String?
    let site_admin : Bool?

}
