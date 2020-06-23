//
//  ViewController.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/8/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import UIKit
import os.log



class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    

    @IBAction func addAlbumButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "createNewAlbum", sender: self)
    }
    
    @IBAction func unwindToListViewController(segue: UIStoryboardSegue) {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedAlbums = loadAlbums() {
            albums += savedAlbums
        }
        else {
            // Load the sample data.
            loadInitialData()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadInitialData() {
        fearInocolumSongs.append(song1)
        fearInocolumSongs.append(song2)
        fearInocolumSongs.append(song3)
        fearInocolumSongs.append(song4)
        fearInocolumSongs.append(song5)
        fearInocolumSongs.append(song6)
        albums.append(fearInoculum)
        
        albums.append(enema_state)
        
        albums.append(fearless)
        
        albums.append(katy_hudson)
        
        albums.append(too_fast_love)
        
        albums.append(so_what_fuss)
        
        albums.append(sick_boy)
        
        albums.append(the_far_day)
        
        albums.append(american_idiot)
        
        albums.append(meteora)
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

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MusicAlbums.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = albums[indexPath.row].albumTitle
        cell.detailTextLabel?.text = albums[indexPath.row].artist
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "goToAlbum", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            albums.remove(at: indexPath.row)
            tableView.beginUpdates()
            saveAlbums()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "goToAlbum" {
        let destinationVC = segue.destination as! AlbumViewController
        destinationVC.albumName = albums[(tableView.indexPathForSelectedRow?.row)!].albumTitle
        destinationVC.albumCover = albums[(tableView.indexPathForSelectedRow?.row)!].albumCover
        destinationVC.currentTracks = albums[(tableView.indexPathForSelectedRow?.row)!].tracks
        destinationVC.artistName = albums[(tableView.indexPathForSelectedRow?.row)!].artist
        destinationVC.yearName = albums[(tableView.indexPathForSelectedRow?.row)!].year
        destinationVC.recordingLabelName = albums[(tableView.indexPathForSelectedRow?.row)!].label
        destinationVC.indexNumber = tableView.indexPathForSelectedRow?.row 
        }
    }
   
}
    
    


