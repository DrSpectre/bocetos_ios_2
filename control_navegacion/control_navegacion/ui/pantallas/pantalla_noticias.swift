//
//  pantalla_noticias.swift
//  control_navegacion
//
//  Created by Jadzia Gallegos on 29/09/25.
//
import SwiftUI

struct PantallaNoticias: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        if(controlador.publicaciones.isEmpty){
            Text("Estamos descargando los datos, por favor espera.")
        }
        else{
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        ForEach(controlador.publicaciones) { publicacion in
                            
                            NavigationLink{
                                PantallaPublicacion(publicacion_actual: publicacion)
                            } label: {
                                Encabezado(publicacion: publicacion)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaNoticias()
        .environment(ControladorGeneral())
}

