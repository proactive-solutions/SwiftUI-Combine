import SDWebImageSwiftUI
import SwiftUI

fileprivate extension VideoDownloadStatus {
    func accessibilityIdentifier() -> String {
        switch self {
        case .inProgress:
            return Constants.AccessibilityIndentifiers.downloadProgressBarIdentifier

        case .notDownloaded, .downloaded:
            return Constants.AccessibilityIndentifiers.playVideoButtonIdentifier
        }
    }
}

struct VideoPreview: View {

    // MARK: Props

    let thumbnailURL: String
    let videoProgress: Double
    let videoStatus: VideoDownloadStatus

    let playAction: () -> Void

    var body: some View {
        ZStack {
            WebImage(url: URL(string: thumbnailURL))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color(UIColor.systemBackground))
                .cornerRadius(Constants.Metric.cornerRadius)
                .padding(Constants.Metric.padding)

            if self.videoStatus == .inProgress {
                ProgressBar(value: self.videoProgress)
                    .frame(
                        width: Constants.Metric.progressBarWidth,
                        height: Constants.Metric.progressBarHeight
                    )
                    .accessibility(identifier: Constants.AccessibilityIndentifiers.downloadProgressBarIdentifier)
            } else {
                Button(action: {
                    self.playAction()
                }) {
                    HStack {
                        Image(systemName: Constants.SFSymbols.playCircle)
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(
                                width: Constants.Metric.videoPlayButtonWidth,
                                height: Constants.Metric.videoPlayButtonHeight
                            )
                            .aspectRatio(contentMode: .fill)
                    }
                }.accessibility(identifier: self.videoStatus.accessibilityIdentifier())
            }
        }
    }
}
