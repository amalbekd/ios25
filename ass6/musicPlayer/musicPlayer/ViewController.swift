//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Dimash Amalbek on 08.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var trackLabel: UILabel!
    
    @IBOutlet weak var playPauseButton: UIButton!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    
    var player: AVAudioPlayer?
    var currentIndex = 0
    
    
    
    let tracks = [
        Track(title: "Ayau - Kel Kel", artist: "Ayau", coverName: "ayau", fileName: "Kel_Kel"),
        Track(title: "T-Killah И Лоя - Вернись", artist: "T-Killah И Лоя", coverName: "вернись", fileName: "T-Killah И Лоя - Вернись"),
        Track(title: "Звонкий - Голоса", artist: "Звонкий", coverName: "вернись", fileName: "Звонкий - Голоса"),
        Track(title: "M'Dee - Даже Если Ты Сойдёшь С Ума", artist: "M'Dee", coverName: "даже если ты сойдешь с ума", fileName: "M'Dee - Даже Если Ты Сойдёшь С Ума"),
        Track(title: "M'Dee - Нужна", artist: "M'Dee", coverName: "нужна", fileName: "M'Dee - Нужна"),
        Track(title: "Қозы Көрпеш - Баян Сұлу", artist: "Bonapart MEREY", coverName: "qozy korpesh", fileName: "Bonapart_MEREY_-_ozy_K_rpesh_-_Bayan_S_lu_(SkySound.cc)")
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
        
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try? AVAudioSession.sharedInstance().setActive(true)
    }
    
//    func setupTrack() { ne nuzhen, udali
//        let track = tracks[currentIndex]
//        trackLabel.text = "\(track.title) — \(track.artist)"
//        coverImageView.image = UIImage(named: track.coverName)
//        
//        if let url = Bundle.main.url(forResource: "musics/\(track.fileName)", withExtension: "mp3") {
//            print("Файл найден: \(url)")
//            player = try? AVAudioPlayer(contentsOf: url)
//            player?.volume = 1.0
//            player?.prepareToPlay()
//        } else {
//            print("Файл НЕ найден: musics/\(track.fileName).mp3")
//        }
//    }
    
    func setupAudioPlayer() {
        let currentSong = tracks[currentIndex]
        print("Searching file: songs/\(currentSong.fileName).mp3")
        trackLabel.text = "\(currentSong.title) — \(currentSong.artist)"
        coverImageView.image = UIImage(named: currentSong.coverName)
        
        // Try to find the file inside the "songs" folder
        if let url = Bundle.main.url(forResource: "musics/\(currentSong.fileName)", withExtension: "mp3") {
            print(" Found in folder: \(url.lastPathComponent)")
            createPlayer(from: url)
        }
        // If not found, try to find it directly in the main bundle
        else if let altUrl = Bundle.main.url(forResource: currentSong.fileName, withExtension: "mp3") {
            print("Found in main bundle: \(currentSong.fileName).mp3")
            createPlayer(from: altUrl)
        } else {
            print("Song file not found anywhere!")
        }
    }
    
    // Create player with found file
    func createPlayer(from url: URL) {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try? AVAudioPlayer(contentsOf: url)
            player?.volume = 1.0
            player?.prepareToPlay()
            print("Audio player created successfully")
        } catch {
            print("Error: \(error)")
        }
    }
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        guard let player = player else { return }
        if player.isPlaying {
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        currentIndex = (currentIndex + 1) % tracks.count
        setupAudioPlayer()
        player?.play()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
    
    @IBAction func prevTapped(_ sender: UIButton) {
        currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
        setupAudioPlayer()
        player?.play()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }
}
