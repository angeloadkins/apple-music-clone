//
//  NewViewController.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/9/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import UIKit
import os.log

class NewViewController: UIViewController {

    
    @IBOutlet weak var albumTitle: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var recordLabelText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapButton(_ sender: Any) {
        albumTitle.resignFirstResponder()
        artistText.resignFirstResponder()
        yearText.resignFirstResponder()
        recordLabelText.resignFirstResponder()
    }
    
    @IBAction func createAlbumButton(_ sender: UIButton) {
        let albumInput = albumTitle.text
        let artistInput = artistText.text
        let yearInput = yearText.text
        let recordLabelInput = recordLabelText.text
        let newAlbum = MusicAlbums(albumTitle: albumInput!, artist: artistInput!, year: yearInput!, label: recordLabelInput!, albumCover: UIImage(imageLiteralResourceName: "tool"), tracks: fearInocolumSongs)
        albums.append(newAlbum)
        saveAlbums()
        self.performSegue(withIdentifier: "backToHome", sender: self)
    }
    
    private func saveAlbums() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(albums, toFile: MusicAlbums.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Albums successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save albums...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadAlbums() -> [MusicAlbums]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: MusicAlbums.ArchiveURL.path) as? [MusicAlbums]
    }
}

