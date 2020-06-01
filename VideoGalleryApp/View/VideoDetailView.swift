import SwiftUI

private extension VideoDownloadStatus {
    func navBarAccessibilityIdentifier() -> String {
        switch self {
        case .inProgress:
            return Constants.AccessibilityIndentifiers.cancelDownloadButtonIdentifier

        case .notDownloaded, .downloaded:
            return Constants.AccessibilityIndentifiers.downloadVideoButtonIdentifier
        }
    }
}

struct VideoDetailView: View {
    // MARK: - States

    @State private var isVideoPlaying = false

    // MARK: - Observed objects

    @ObservedObject private var viewModel = VideoDetailsViewModel()

    // MARK: - Properties

    let selectedVideo: Video

    // MARK: - View

    var body: some View {
        ScrollView {
            VStack {
                VideoPreview(
                    thumbnailURL: selectedVideo.thumbnail,
                    videoProgress: self.viewModel.videoProgress,
                    videoStatus: self.viewModel.videoStatus
                ) {
                    self.isVideoPlaying = true
                }
                VideoDescriptionView(
                    title: selectedVideo.name,
                    videoDescription: selectedVideo.videoDescription
                )
            }
        }
        .padding(Constants.Metric.padding)
        .sheet(isPresented: $isVideoPlaying) {
            AVPlayerView(videoURL: URL(string: self.selectedVideo.videoLink)!)
                .edgesIgnoringSafeArea(.all)
        }
        .navigationBarItems(
            trailing: Button(action: {
                switch self.viewModel.videoStatus {
                case .inProgress:
                    self.viewModel.cancelActiveDownload()

                case .notDownloaded:
                    self.viewModel.downloadAndSaveVideo(url: self.selectedVideo.videoLink)

                case .downloaded:
                    break
                }
            }) {
                self.viewModel.videoStatus.rightNavBarButton()
            }
            .accessibility(identifier: self.viewModel.videoStatus.navBarAccessibilityIdentifier())
        )
        .navigationBarTitle("", displayMode: .inline)
        .onDisappear(perform: self.viewModel.cancelActiveDownload)
    }
}
