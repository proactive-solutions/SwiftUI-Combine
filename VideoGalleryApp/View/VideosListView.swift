import SwiftUI

struct VideosListView: View {

    // MARK: - Properties

    let videos: [Video]

    // MARK: - View

    var body: some View {
        List {
            ForEach(videos, id: \.self) { video in
                ZStack(alignment: .leading) {
                    NavigationLink(destination: VideoDetailView(selectedVideo: video)) {
                        VideoThumbView(video: video)
                    }
                }
            }
        }
    }
}

