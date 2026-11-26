//
//  ContentView.swift
//  ExamenOrdinario20829
//
//  Created by Alejandro Urbina on 25/11/26.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("nombreUsuario") private var nombre = ""
    @State private var mostrarMonsters = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("fondo")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipped()
                    .overlay(Color.black.opacity(0.28))
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Te llamas")
                        .foregroundStyle(.yellow)
                        .shadow(color: .black.opacity(0.6), radius: 5)

                    TextField(
                        "Escribe tu nombre",
                        text: $nombre
                    )
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled()
                        .textFieldStyle(.plain)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.yellow)

                    Button("Comenzar") {
                        mostrarMonsters = true
                    }
                    .font(.headline)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 25)
                    .padding(.vertical, 20)
                    .background(.yellow, in: RoundedRectangle(cornerRadius: 10))
                    .disabled(nombre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .frame(maxWidth: 320)
                .padding(.horizontal, 24)
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(isPresented: $mostrarMonsters) {
                Monsters()
            }
        }
    }
}

#Preview {
    ContentView()
}
