//
//  respuesta_joke_api.swift
//  nueva_app_con_api
//
//  Created by Jadzia Gallegos on 27/10/25.
//


struct RespuestaJokeApi: Codable{
    let error: Bool
    let category: String
    let type: String
    let joke: String?
    let setup: String?
    let delivery: String?
    let id: Int
}
