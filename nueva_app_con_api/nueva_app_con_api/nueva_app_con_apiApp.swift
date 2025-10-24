//
//  nueva_app_con_apiApp.swift
//  nueva_app_con_api
//
//  Created by Jadzia Gallegos on 20/10/25.
//

import SwiftUI

@main
struct nueva_app_con_apiApp: App {
    @State var aplicacion = DemonSlayerApp()
    
    var body: some Scene {
        WindowGroup {
            PantallaPersonajes()
                .environment(aplicacion)
        }
    }
}
