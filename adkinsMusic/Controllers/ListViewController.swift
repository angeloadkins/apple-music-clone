//
//  ViewController.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/8/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import UIKit

var albums = [MusicAlbums]()
var fearInocolumSongs = [Tracks]()

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
        let song1 = Tracks(trackNumber: 1, song: "Fear Inoculum", length: "10:20", composer: "tool")
        fearInocolumSongs.append(song1)
        let song2 = Tracks(trackNumber: 2, song: "Pneuma", length: "11:53", composer: "tool")
        fearInocolumSongs.append(song2)
        let song3 = Tracks(trackNumber: 3, song: "Invincible", length: "12:44", composer: "tool")
        fearInocolumSongs.append(song3)
        let song4 = Tracks(trackNumber: 4, song: "Descending", length: "13:37", composer: "tool")
        fearInocolumSongs.append(song4)
        let song5 = Tracks(trackNumber: 5, song: "Culling Voices", length: "10:05", composer: "tool")
        fearInocolumSongs.append(song5)
        let song6 = Tracks(trackNumber: 6, song: "Chocolate Chip Trip", length: "15:43", composer: "tool")
        fearInocolumSongs.append(song6)
        let fearInoculum = MusicAlbums(albumTitle: "Fear Inoculum", artist: "Tool", year: "2019", label: "RCA", albumCover: UIImage(imageLiteralResourceName: "tool"), tracks: fearInocolumSongs)
        albums.append(fearInoculum)
        
        let enema_state = MusicAlbums(albumTitle: "Enema of the State", artist: "Blink 182", year: "1999", label: "MCA Records", albumCover: UIImage(imageLiteralResourceName: "enema_state"), tracks: fearInocolumSongs)
        albums.append(enema_state)
        
        let fearless = MusicAlbums(albumTitle: "Fearless", artist: "Taylor Swift", year: "2008", label: "Big Machine", albumCover: UIImage(imageLiteralResourceName: "fearless"), tracks: fearInocolumSongs)
        albums.append(fearless)
        
        let katy_hudson = MusicAlbums(albumTitle: "Katy Hudson", artist: "Katy Perry", year: "2001", label: "Red Hill", albumCover: UIImage(imageLiteralResourceName: "katy_hudson"), tracks: fearInocolumSongs)
        albums.append(katy_hudson)
        
        let too_fast_love = MusicAlbums(albumTitle: "Too Fast For Love", artist: "Motley Crue", year: "1981", label: "Leathur Elektra", albumCover: UIImage(imageLiteralResourceName: "too_fast"), tracks: fearInocolumSongs)
        albums.append(too_fast_love)
        
        let so_what_fuss = MusicAlbums(albumTitle: "So What The Fuss", artist: "Stevie Wonder", year: "2005", label: "Motown", albumCover: UIImage(imageLiteralResourceName: "sowhatthefuss"), tracks: fearInocolumSongs)
        albums.append(so_what_fuss)
        
        let sick_boy = MusicAlbums(albumTitle: "Sick Boy", artist: "The Chainsmokers", year: "2018", label: "Disruptor", albumCover: UIImage(imageLiteralResourceName: "sick_boy"), tracks: fearInocolumSongs)
        albums.append(sick_boy)
        
        let the_far_day = MusicAlbums(albumTitle: "The Far Day", artist: "The Chainsmokers", year: "2017", label: "4AD", albumCover: UIImage(imageLiteralResourceName: "the_far_field"), tracks: fearInocolumSongs)
        albums.append(the_far_day)
        
        let american_idiot = MusicAlbums(albumTitle: "American Idiot", artist: "Green Day", year: "2004", label: "Reprise", albumCover: UIImage(imageLiteralResourceName: "american_idiot"), tracks: fearInocolumSongs)
        albums.append(american_idiot)
        
        let meteora = MusicAlbums(albumTitle: "Meteora", artist: "Linkin Park", year: "2003", label: "Warner Bros", albumCover: UIImage(imageLiteralResourceName: "meteora"), tracks: fearInocolumSongs)
        albums.append(meteora)
        
        tableView.dataSource = self
        tableView.delegate = self
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
    
    


