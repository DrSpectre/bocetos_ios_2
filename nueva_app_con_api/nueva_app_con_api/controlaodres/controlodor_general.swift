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
    var datos_pagina_actual: DatosPagina? = nil
    var pagina_actual = 1
    static let demon_slayer_api = "https://demonslayer-api.com/api/v1"
    
    init() {
        Task{
            await descargar_personajes()
        }
    }
    
    func descargar_personajes() async {
        guard let pagina_con_datos: Pagina = await ConexionAPI.descargar_datos(
                    url: "\(DemonSlayerApp.demon_slayer_api)/characters?page=\(pagina_actual)"
                ) else {
                print("No hay conexion a internet")
            return
        }
        datos_pagina_actual = pagina_con_datos.datos
        personajes = pagina_con_datos.personajes
    }
    
    func siguiente_pagina(){
        pagina_actual = pagina_actual + 1
        
        if(pagina_actual > datos_pagina_actual!.totalPages){
            pagina_actual -= 1
            return
        }
        
        print("pagina actual: \(pagina_actual)")
        Task{
            await descargar_personajes()
        }
    }
}

