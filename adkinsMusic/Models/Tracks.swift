//
//  Tracks.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/9/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import Foundation

struct Tracks {
    
    var song: String?
    var length: String?
    var composer: String?
    var trackNumber: Int?
    
    init(trackNumber: Int, song: String, length: String, composer: String ) {
        self.song = song
        self.length = length
        self.composer = composer
        self.trackNumber = trackNumber
    }
}

var fearInocolumSongs = [Tracks]()

let song1 = Tracks(trackNumber: 1, song: "Fear Inoculum", length: "10:20", composer: "tool")
let song2 = Tracks(trackNumber: 2, song: "Pneuma", length: "11:53", composer: "tool")
let song3 = Tracks(trackNumber: 3, song: "Invincible", length: "12:44", composer: "tool")
let song4 = Tracks(trackNumber: 4, song: "Descending", length: "13:37", composer: "tool")
let song5 = Tracks(trackNumber: 5, song: "Culling Voices", length: "10:05", composer: "tool")
let song6 = Tracks(trackNumber: 6, song: "Chocolate Chip Trip", length: "15:43", composer: "tool")



