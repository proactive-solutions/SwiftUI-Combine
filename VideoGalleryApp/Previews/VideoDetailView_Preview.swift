import SwiftUI

// MARK: - VideoDetailView Preview

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailView(
            selectedVideo: Video(
                id: 950,
                name: "How To Hold Your iPhone When Taking Photos",
                thumbnail: "https://i.picsum.photos/id/477/2000/2000.jpg",
                videoDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                videoLink: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
            )
        )
    }
}
