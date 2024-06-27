//
//  VideoListView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct VideoListView: View {
    
    @State private var videos: [Video] = Bundle.main.decode("videos.json")

    let hapticFeedBack = UINotificationFeedbackGenerator()
    
    var body: some View {
        
        NavigationSplitView {
            
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                     
                    Button(action: {
                        videos.shuffle()
                        hapticFeedBack.notificationOccurred(.success )
                        
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                    
                }
            }
            .tint(.gray)
            
        } detail: {
            EmptyView()
        }
    }
}

#Preview {
    VideoListView()
}
