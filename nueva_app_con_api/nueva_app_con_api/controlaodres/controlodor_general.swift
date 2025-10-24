//
//  controlodor_general.swift
//  nueva_app_con_api
//
//  Created by Jadzia Gallegos on 20/10/25.
//
import SwiftUI
import Foundation

@Observable
@MainActor
class DemonSlayerApp{
    var personajes = [Personaje]()
    var pagina_actual = 1
    static let demon_slayer_api = "https://demonslayer-api.com/api/v1"
    
    init() {
        Task{
            await descargar_personajes()
        }
    }
    
    func descargar_personajes() async {
        guard let pagina_con_datos: Pagina = await ConexionAPI.descargar_datos(
                    url: "\(DemonSlayerApp.demon_slayer_api)/characters"
                ) else {
            print("No hay conexion a internet")
            return
        }
        
        personajes = pagina_con_datos.personajes
    }
}

