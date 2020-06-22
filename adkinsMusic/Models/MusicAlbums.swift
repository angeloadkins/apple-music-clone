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
}

var albums = [MusicAlbums]()

let fearInoculum = MusicAlbums(albumTitle: "Fear Inoculum", artist: "Tool", year: "2019", label: "RCA", albumCover: UIImage(imageLiteralResourceName: "tool"), tracks: fearInocolumSongs)
let enema_state = MusicAlbums(albumTitle: "Enema of the State", artist: "Blink 182", year: "1999", label: "MCA Records", albumCover: UIImage(imageLiteralResourceName: "enema_state"), tracks: fearInocolumSongs)
let fearless = MusicAlbums(albumTitle: "Fearless", artist: "Taylor Swift", year: "2008", label: "Big Machine", albumCover: UIImage(imageLiteralResourceName: "fearless"), tracks: fearInocolumSongs)
let katy_hudson = MusicAlbums(albumTitle: "Katy Hudson", artist: "Katy Perry", year: "2001", label: "Red Hill", albumCover: UIImage(imageLiteralResourceName: "katy_hudson"), tracks: fearInocolumSongs)
let too_fast_love = MusicAlbums(albumTitle: "Too Fast For Love", artist: "Motley Crue", year: "1981", label: "Leathur Elektra", albumCover: UIImage(imageLiteralResourceName: "too_fast"), tracks: fearInocolumSongs)
let so_what_fuss = MusicAlbums(albumTitle: "So What The Fuss", artist: "Stevie Wonder", year: "2005", label: "Motown", albumCover: UIImage(imageLiteralResourceName: "sowhatthefuss"), tracks: fearInocolumSongs)
let sick_boy = MusicAlbums(albumTitle: "Sick Boy", artist: "The Chainsmokers", year: "2018", label: "Disruptor", albumCover: UIImage(imageLiteralResourceName: "sick_boy"), tracks: fearInocolumSongs)
let the_far_day = MusicAlbums(albumTitle: "The Far Day", artist: "The Chainsmokers", year: "2017", label: "4AD", albumCover: UIImage(imageLiteralResourceName: "the_far_field"), tracks: fearInocolumSongs)
let american_idiot = MusicAlbums(albumTitle: "American Idiot", artist: "Green Day", year: "2004", label: "Reprise", albumCover: UIImage(imageLiteralResourceName: "american_idiot"), tracks: fearInocolumSongs)
let meteora = MusicAlbums(albumTitle: "Meteora", artist: "Linkin Park", year: "2003", label: "Warner Bros", albumCover: UIImage(imageLiteralResourceName: "meteora"), tracks: fearInocolumSongs)

