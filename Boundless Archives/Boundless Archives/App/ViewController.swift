//
//  File.swift
//  Boundless 
//
//  Created by Bassil Taylor on 4/18/24.
//

import UIKit
import Firebase
import AVFoundation


class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
        
        
        // Create UIImageView
        let imageView = UIImageView(image: UIImage(named: "chest.png"))
        imageView.contentMode = .scaleAspectFit // Adjust content mode as needed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add UIImageView to the view
        view.addSubview(imageView)
        
        // Add Auto Layout constraints to center the image in the view
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // Add width and height constraints if needed
        ])
    }
    
    
    func setupAudioPlayer() {
        if let bundlePath = Bundle.main.path(forResource: "titanium-170190.mp3", ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bundlePath))
                audioPlayer?.numberOfLoops = -1  // Infinite looping
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading audio file")
            }
        }
        
    }
}

   
    
