//
//  ContentView.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 14/06/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var text: String = ""
    @State private var typesTags: [String] = ["Tipo1", "Tipo2"]
    
    var body: some View {
        VStack {
            TextField("Procure o seu Pokémon", text: $text)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Procurar", role: nil, action:{
                print("Procurando por \(text)")
            })
            .buttonStyle(.borderedProminent)
            
            Text("#000")
                .padding()
            
            Text("Pokemon")
                .padding()
            
            Image("exampleImage")
                .resizable()
                .scaledToFit()
                .frame(width: 280, height: 280)
                .padding(.top, 20) // Adiciona padding superior
            
            HStack {
                // types tags
                ForEach(typesTags, id: \.self) { tag in
                    Text(tag)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Capsule().fill(Color.green))
                        .overlay(
                            Capsule().stroke(Color.gray, lineWidth: 1)
                        )
                        .padding(6)
                }
            }
            
            Text("Height: 0.0m")
            
            Text("Weight: 0.0kg")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

