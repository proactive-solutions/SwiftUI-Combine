import SwiftUI

struct VideoDescriptionView: View {

    // MARK: -Properties

    let title: String
    let videoDescription: String

    var body: some View {
        Group {
            Text(title)
                .font(.title)
                .multilineTextAlignment(.center)
            Text(videoDescription)
                .font(.subheadline)
        }
    }
}

