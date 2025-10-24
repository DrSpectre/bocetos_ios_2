//
//  personaje.swift
//  nueva_app_con_api
//
//  Created by Jadzia Gallegos on 20/10/25.
//

import Foundation

struct Personaje: Identifiable, Codable {
    let id: Int
    let name: String
    let age: Int?
    let gender: String
    let race: String
    let description: String
    let img: String
    let affiliation_id: Int
    let arc_id: Int
    let quote: String
}
