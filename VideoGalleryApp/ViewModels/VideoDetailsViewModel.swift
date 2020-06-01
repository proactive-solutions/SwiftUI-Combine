import Foundation
import SwiftUI

enum VideoDownloadStatus {
    //  MARK: - Cases

    case notDownloaded
    case inProgress
    case downloaded

    //  MARK: - Components

    func rightNavBarButton() -> AnyView {
        switch self {
        case .notDownloaded:
            return AnyView(
                HStack {
                    Text(Constants.Texts.downloadVideo)
                    Image(systemName: Constants.SFSymbols.squardAndArrowDown)
                }
            )

        case .inProgress:
            return AnyView(
                HStack {
                    Text(Constants.Texts.downloadVideo)
                    Image(systemName: Constants.SFSymbols.squardAndArrowDown)
                }
            )

        case .downloaded:
            return AnyView(EmptyView())
        }
    }
}

final class VideoDetailsViewModel: ObservableObject {
    //  MARK: - Observable Properties

    @Published private(set) var videoProgress: Double = 0.0
    @Published private(set) var videoStatus = VideoDownloadStatus.notDownloaded

    //  MARK: - Private Properties

    private var downloader: VideoDownloadable?

    //  MARK: - Functions

    /// Cancels current downloading video
    func cancelActiveDownload() {
        downloader?.stop()
        videoStatus = .notDownloaded
        downloader = nil
    }

    /// Downloads and saves the video in the Document directory. Downloaded file name is created from
    func downloadAndSaveVideo(url: String, downloader _downloader: VideoDownloadable = DownloadWorker()) {
        cancelActiveDownload()
        videoStatus = .inProgress
        videoProgress = 0.0

        self.downloader = _downloader
        self.downloader?.start(
            url: url,
            progressCallback: { [weak self] progress in
                self?.videoProgress = progress
            },
            response: { [weak self] response in
                switch response.result {
                case .success:
                    self?.videoProgress = 1.0
                    self?.videoStatus = .downloaded

                case .failure:
                    self?.videoProgress = 0.0
                    self?.videoStatus = .notDownloaded
                }
            }
        )
    }

    deinit {
        cancelActiveDownload()
    }
}

