//
//  AlbumViewController.swift
//  adkinsMusic
//
//  Created by Angelo Adkins on 6/8/20.
//  Copyright © 2020 Angelo Adkins. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    var albumName: String?
    var albumCover: UIImage?
    var currentTracks: [Tracks]?
    var artistName: String?
    var yearName: String?
    var recordingLabelName: String?
    var indexNumber: Int?
    
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var trackTableView: UITableView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var recordingLabelLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        albumTitle.text = albumName
        albumImage.image = albumCover
        trackTableView.dataSource = self
        artistLabel.text = artistName
        yearLabel.text = yearName
        recordingLabelLabel.text = recordingLabelName
    }
    
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToEdit", sender: self)
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
