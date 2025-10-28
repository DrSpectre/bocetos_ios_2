//
//  pantalla_personajes.swift
//  nueva_app_con_api
//
//  Created by Jadzia Gallegos on 24/10/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(DemonSlayerApp.self) var controlador
    
    var body: some View {
        Spacer()
        
        NavigationStack{
            ScrollView{
                ForEach(controlador.personajes){ personaje in
                    NavigationLink{
                        Text("Pantalla de el personaje \(personaje.name)")
                        Text("El chiste es: \(controlador.chiste)")
                            .onAppear{
                                controlador.descargar_chiste()
                            }
                    }
                    label: {
                        TarjetaPersonaje(personaje: personaje)
                    }
                    .buttonStyle(.plain)
                    
                }
            }
        }
        
        
        Spacer()
        
        Text("Siguiente pagina")
            .onTapGesture {
                controlador.siguiente_pagina()
            }
    }
}

#Preview {
    PantallaPersonajes()
        .environment(DemonSlayerApp())
    
}
