//
//  controlador_app.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 03/10/25.
//
import SwiftUI
import Foundation

@Observable
@MainActor
class ControladorGeneral{
    let url_base = "https://jsonplaceholder.typicode.com"
    
    var publicaciones: [Publicacion] = []
    
    func descargar_publicaciones() async {
        guard let publiaciones_descargadas: [Publicacion] = await ServicioWeb().descargar_datos(url: "\(url_base)/posts")
            else { return }
        publicaciones = publiaciones_descargadas
    }
    
}
