//
//  AudioController.swift
//  Boundless 
//
//  Created by Bassil Taylor on 5/9/24.
//

import Foundation
import AVFoundation
var audioPlayer: AVAudioPlayer?



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
