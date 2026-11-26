//
//  DataModel.swift
//  ExamenOrdinario20829
//
//  Created by Alejandro Urbina on 25/11/26.
//

import Foundation

let monstersURL = URL(string: "https://api.hyrule-compendium.com/v3/compendium/category/monsters")!

struct Monster: Decodable, Identifiable {
    let id: Int
    let name: String
    let image: URL?
    let description: String
}

struct MonstersResponse: Decodable {
    let data: [Monster]
}

