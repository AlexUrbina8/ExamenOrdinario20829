//
//  MonsterViewDescription.swift
//  ExamenOrdinario20829
//
//  Created by Alejandro Urbina on 25/11/26.
//

import SwiftUI

struct MonsterViewDescription: View {
    let monstruo: Monster
    @AppStorage("nombreUsuario") private var nombreUsuario = ""

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    Text(monstruo.name.uppercased())
                        .font(.title)
                    Text("\(nombreUsuario), Hey Listen")
                    Text(monstruo.description)
                    Text("COMMON LOCATIONS")
                        .font(.system(size: 20))
                    Text("DROPPABLE ITEMS")
                        .font(.system(size: 20))
                }
                .padding()
                .frame(maxWidth: .infinity, minHeight: geometry.size.height)
                .multilineTextAlignment(.center)
            }
        }
        .foregroundStyle(.yellow)
        .background(Color.black.ignoresSafeArea())
        .tint(.yellow)
    }
}





