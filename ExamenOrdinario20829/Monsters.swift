//
//  Monsters.swift
//  ExamenOrdinario20829
//
//  Created by Alejandro Urbina on 25/11/26.
//

import SwiftUI

struct Monsters: View {
    @State private var monstruos: [Monster] = []
    @State private var errorDeCarga = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("COMPENDIUM")
                .font(.title)
                .foregroundStyle(.yellow)

            if errorDeCarga {
                Text("Error 67 y falta de AURA No se pudieron cargar los monstruos.")
                    .foregroundStyle(.white)
            } else if monstruos.isEmpty {
                ProgressView()
                    .tint(.yellow)
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(monstruos) { monstruo in
                            NavigationLink {
                                MonsterViewDescription(monstruo: monstruo)
                            } label: {
                                HStack(spacing: 12) {
                                    AsyncImage(url: monstruo.image) { imagen in
                                        imagen
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        Color.gray.opacity(0.3)
                                    }
                                    .frame(width: 64, height: 64)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(monstruo.name.uppercased())
                                            .font(.title3.bold())
                                            .foregroundStyle(.yellow)
                                            
                                        Text("\(monstruo.id)")
                                            .foregroundStyle(.blue)
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding()
        .background(Color.black.ignoresSafeArea())
        .task {
            do {
                let (data, _) = try await URLSession.shared.data(from: monstersURL)
                monstruos = try JSONDecoder().decode(MonstersResponse.self, from: data).data
            } catch {
                errorDeCarga = true
            }
        }
    }
}

#Preview {
    Monsters()
}




