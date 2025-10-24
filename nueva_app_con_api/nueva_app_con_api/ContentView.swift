//
//  ContentView.swift
//  nueva_app_con_api
//
//  Created by Jadzia Gallegos on 20/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://www.demonslayer-api.com/api/v1/charaters/images/16.webp")) { image in
                image.resizable() // Apply modifiers to the downloaded image
            } placeholder: {
                ProgressView() // Show a loading indicator
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
