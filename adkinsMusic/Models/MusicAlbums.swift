//
//  MusicAlbums.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/8/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import UIKit

struct MusicAlbums {
    
    
    static let cellIdentifier = "ReusableCell"
    
    var albumTitle: String?
    var artist: String?
    var year: String?
    var label: String?
    var albumCover: UIImage?
    var tracks: [Tracks]?
    
    init(albumTitle: String, artist: String, year: String, label: String, albumCover: UIImage, tracks: [Tracks]){
        
        self.albumTitle = albumTitle
        self.artist = artist
        self.year = year
        self.label = label
        self.albumCover = albumCover
        self.tracks = tracks
    }
    
    
//    var music = [["Album": "So What The Fuss", "Artist": "Stevie Wonder", "Year": "2005", "Label": "Motown", "Cover": UIImage(named: "sowhatthefuss") as Any],
//    ["Album": "Sick Boy", "Artist": "The Chainsmokers", "Year": "2018", "Label": "Disruptor", "Cover": UIImage(named: "sick_boy") as Any],
//    ["Album": "The Far Day", "Artist": "Future Islands", "Year": "2017", "Label": "4AD", "Cover": UIImage(named: "the_far_field") as Any],
//    ["Album": "American Idiot", "Artist": "Green Day", "Year": "2004", "Label": "Reprise", "Cover": UIImage(named: "american_idiot") as Any],
//    ["Album": "Meteora", "Artist": "Linkin Park", "Year": "2003", "Label": "Warner Bros", "Cover": UIImage(named: "meteora") as Any]]
    
}
