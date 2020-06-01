import CoreGraphics
import Foundation
import SwiftUI

enum Constants {}

// MARK: - Metric values

extension Constants {
    enum Metric {
        static let padding: CGFloat = 8.0
        static let cornerRadius: CGFloat = 5.0
        static let thumbImageHeight: CGFloat = 60.0
        static let thumbImageWidth: CGFloat = 60.0
        static let progressBarWidth: CGFloat = 250.0
        static let progressBarHeight: CGFloat = 50.0
        static let videoPlayButtonWidth: CGFloat = 50.0
        static let videoPlayButtonHeight: CGFloat = 50.0
        static let circularProgressLineWidth: CGFloat = 20.0
    }
}

// MARK: - Texts

extension Constants {
    enum Texts {
        static let videos = "Videos"
        static let downloadVideo = "Download Video"
        static let cancelDownload = "Cancel Download"
        static let loading = "Loading..."
    }
}

// MARK: - ErrorMessages

extension Constants {
    enum ErrorMessages {
        static let jsonFileLoadFailed = "Can't find videos.json file"
        static let fileNameCreationFailed = "Could not create file name"
    }
}

// MARK: - JSONKeys

extension Constants {
    enum JSONKeys {
        static let videos = "videos"
    }
}

// MARK: - Colors

extension Constants {
    enum Colors {
        static let playVideoButtonColor = Color.white
        static let backgroundColor = UIColor.systemBackground
        static let circularProgressUnfilledColor = UIColor.systemGray
        static let circularProgressFilledColor = UIColor.blue
    }
}

// MARK: - SFSymbols

extension Constants {
    enum SFSymbols {
        static let playCircle = "play.circle"
        static let squardAndArrowDown = "square.and.arrow.down"
        static let stopFill = "stop.fill"
    }
}

// MARK: - AccessibilityIndentifiers

extension Constants {
    enum AccessibilityIndentifiers {
        static let downloadProgressBarIdentifier = "VideoDownloadProgressBar"
        static let playVideoButtonIdentifier = "PlayVideoButton"
        static let videoListTableIdentifier = "VideoListTable"
        static let cancelDownloadButtonIdentifier = "CancelDownloadButton"
        static let downloadVideoButtonIdentifier = "DownloadVideoButton"
        static let loadingTextIdentifier = "LoadingText"
    }
}
