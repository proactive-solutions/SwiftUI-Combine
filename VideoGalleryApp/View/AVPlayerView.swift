import AVKit
import SwiftUI
import UIKit

struct AVPlayerView: UIViewControllerRepresentable {

    let videoURL: URL

    private var player: AVPlayer {
        return AVPlayer(url: videoURL)
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context _: Context) {
        playerController.modalPresentationStyle = .fullScreen
        playerController.player = player
        playerController.player?.play()
    }

    func makeUIViewController(context _: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }
}

