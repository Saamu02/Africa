//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileExtension: String) -> AVPlayer {
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    
    return videoPlayer!
}
