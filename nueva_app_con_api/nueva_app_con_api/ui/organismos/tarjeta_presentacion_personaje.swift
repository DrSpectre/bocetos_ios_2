//
//  tarjeta_presentacion_personaje.swift
//  nueva_app_con_api
//
//  Created by Jadzia Gallegos on 27/10/25.
//
import SwiftUI


struct TarjetaPersonaje: View {
    var personaje: Personaje
    
    var body: some View {
        AsyncImage(url: URL(string: personaje.img)){ estado in
            switch(estado){
                case .empty:
                    Text("Estamos descargando fotos")
                case .success(let imagen):
                    imagen
                        .resizable()
                        .scaledToFit()
                        .padding(10)
                case .failure(_):
                    Text("Parece que no tienes internet")
                @unknown default:
                    Text("Esto es extraño, como lo hiciste")
            }
            
        }
            
        Text("Hola mi nombre es \(personaje.name)")
        
    }
}

#Preview {
    TarjetaPersonaje(
        personaje: Personaje(
            id: 1,
            name: "404",
            age: 34,
            gender: "No",
            race: "Angel Asesino",
            description: "no encontrada",
            img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVo82sXNSNfEN812oa2-EmKelw_EK-y0ux0A&s",
            affiliation_id: 1, arc_id: 1,
            quote: "Datos fabricados")
    )
}
