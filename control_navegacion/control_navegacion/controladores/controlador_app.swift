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
    ///                             a donde enviar las peticiones y que sabe como resolverlas.
    ///                                   192.168.1.100 -> DNS -> Servidor de direcciones web.
    ///                                    facebok -> servidores de ddominio -> facebook - 178.245.3.34
    ///                                    178.244....
    
    var publicaciones: [Publicacion] = []
    var comentarios: [Comentario] = []
    
    var publicacion_actual: Publicacion? = nil
    
    init(){
        Task{
            await descargar_publicaciones()
        }
    }
    
    func descargar_publicaciones() async {
        //#if targetEnvironment(simulator)
        do{
            try await Task.sleep(for: .seconds(10))
        }
        catch{
            
        }
        //#endif
        
        ///                                https://jsonplaceholder.typicode.com/posts
        guard let publiaciones_descargadas: [Publicacion] = await ServicioWeb().descargar_datos(url: "\(url_base)/posts")
            else { return }
        publicaciones = publiaciones_descargadas
    }
    
    private func _descargar_comentarios(id_publiacion: Int) async {
        ///                                https://jsonplaceholder.typicode.com/posts/1/comments

        guard let comentarios_descargados: [Comentario] = await ServicioWeb().descargar_datos(url: "\(url_base)/posts/\(id_publiacion)/comments")
            else { return }
        comentarios = comentarios_descargados
    }
    
    func descargar_comentarios(_ id_publicacion: Int){
        Task{
            await _descargar_comentarios(id_publiacion: id_publicacion)
        }
    }
    
    func publicacion_seleccionada(_ id: Int){
        //print("La publicacion es: \(id)")
        for publicacion in publicaciones{
            if publicacion.id == id{
                publicacion_actual = publicacion
                break
            }
        }
        
        descargar_comentarios(publicacion_actual?.id ?? 0)
    }
    
}
