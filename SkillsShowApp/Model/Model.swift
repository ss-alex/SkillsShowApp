//
//  Model.swift
//  SkillsShowApp
//
//  Created by Лена Мырленко on 2021/2/12.
//

import Foundation

struct Calls: Codable {
    let requests: [Request]
}

// MARK: - Request
struct Request: Codable {
    let id: String?
    let state: String?
    let client: Client
    let type: String?
    let created: String
    let businessNumber: BusinessNumber?
    let origin: String?
    let favorite: Bool?
    let duration: String?
}

// MARK: - BusinessNumber
struct BusinessNumber: Codable {
    let number: String?
    let label: String?
}

// MARK: - Client
struct Client: Codable {
    let address: String
    let Name: String?
}
