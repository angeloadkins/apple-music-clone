//
//  AlbumViewController.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/8/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import UIKit
import os.log 

class AlbumViewController: UIViewController {

    var albumName: String?
    var albumCover: UIImage?
    var currentTracks: [Tracks]?
    var artistName: String?
    var yearName: String?
    var recordingLabelName: String?
    var indexNumber: Int?
    
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var trackTableView: UITableView!
    
    
    @IBOutlet weak var albumTitleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var releaseYearTextField: UITextField!
    
    @IBOutlet weak var recordLabelTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumTitleTextField.text = albumName
        artistTextField.text = artistName
        releaseYearTextField.text = yearName
        recordLabelTextField.text = recordingLabelName
        albumImage.image = albumCover
        trackTableView.dataSource = self
    
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        let indexInt = indexNumber!
        let newAlbumName = albumTitleTextField.text
        let newArtistName = artistTextField.text
        let newYear = releaseYearTextField.text
        let newRecordLabel = recordLabelTextField.text
        albums[indexInt].albumTitle = newAlbumName
        albums[indexInt].artist = newArtistName
        albums[indexInt].year = newYear
        albums[indexInt].label = newRecordLabel
        saveAlbums()
        
        self.performSegue(withIdentifier: "unWindEdit", sender: self)
    }
    
    
    @IBAction func tapgesturealbums(_ sender: UITapGestureRecognizer) {
        albumTitleTextField.resignFirstResponder()
        artistTextField.resignFirstResponder()
        releaseYearTextField.resignFirstResponder()
        recordLabelTextField.resignFirstResponder()
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

extension AlbumViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentTracks!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell2", for: indexPath)
        let songTitle = currentTracks![indexPath.row].song! as Any as? String
        let songNumber = String(currentTracks![indexPath.row].trackNumber!)
        let songLength = currentTracks![indexPath.row].length! as Any as? String
        let songComposer = currentTracks![indexPath.row].composer! as Any as? String
        cell.textLabel?.text = songNumber + " " + songTitle! + " " + songLength! + " " + songComposer!
        return cell
    }
}
