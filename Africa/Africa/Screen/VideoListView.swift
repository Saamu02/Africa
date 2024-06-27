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
        
        NavigationStack {
            
            List {
                ForEach(videos) { video in
                    VideoListItemView(video: video)
                        .padding(.vertical, 8)
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
        }
    }
}

#Preview {
    VideoListView()
}