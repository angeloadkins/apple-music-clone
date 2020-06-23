//
//  Tracks.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/9/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import Foundation
import os.log

class Tracks: NSObject, NSCoding {
    
    
    
    var song: String?
    var length: String?
    var composer: String?
    var trackNumber: Int?
    
    struct PropertyKey {
        
        static let song = "song"
        static let length = "length"
        static let composer = "composer"
        static let trackNumber = "trackNumber"
    }
    
    
    init(trackNumber: Int, song: String, length: String, composer: String ) {
        self.song = song
        self.length = length
        self.composer = composer
        self.trackNumber = trackNumber
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(song, forKey: PropertyKey.song)
        aCoder.encode(length, forKey: PropertyKey.length)
        aCoder.encode(composer, forKey: PropertyKey.composer)
        aCoder.encode(trackNumber, forKey: PropertyKey.trackNumber)
       
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let song = aDecoder.decodeObject(forKey: PropertyKey.song) as? String
            else {
                os_log("Unable to decode the name for an Album object.", log: OSLog.default, type: .debug)
        return nil
        }
        
        //Because the photo is optional, just use conditional cast
        
        guard let length = aDecoder.decodeObject(forKey: PropertyKey.length) as? String else { return nil }
        
        guard let composer = aDecoder.decodeObject(forKey: PropertyKey.composer) as? String else { return nil }
                
        guard let trackNumber = aDecoder.decodeObject(forKey: PropertyKey.trackNumber) as? Int else { return nil }
        
        self.init(trackNumber:trackNumber, song: song, length: length, composer: composer)
    }
}

var fearInocolumSongs = [Tracks]()

let song1 = Tracks(trackNumber: 1, song: "Fear Inoculum", length: "10:20", composer: "tool")
let song2 = Tracks(trackNumber: 2, song: "Pneuma", length: "11:53", composer: "tool")
let song3 = Tracks(trackNumber: 3, song: "Invincible", length: "12:44", composer: "tool")
let song4 = Tracks(trackNumber: 4, song: "Descending", length: "13:37", composer: "tool")
let song5 = Tracks(trackNumber: 5, song: "Culling Voices", length: "10:05", composer: "tool")
let song6 = Tracks(trackNumber: 6, song: "Chocolate Chip Trip", length: "15:43", composer: "tool")



