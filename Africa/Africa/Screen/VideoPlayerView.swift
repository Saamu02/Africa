//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileExtension: "mp4")) { }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
                , alignment: .topLeading
            )
        }
        .tint(.accent)
        .navigationTitle(videoTitle)
    }
}

#Preview {
    NavigationStack {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion ")
            .navigationBarTitleDisplayMode(.inline )
    }
}
