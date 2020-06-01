import SDWebImageSwiftUI
import SwiftUI

struct VideoThumbView: View {

    // MARK: - Properties

    let video: Video

    // MARK: - View

    var body: some View {
        HStack {
            WebImage(url: URL(string: video.thumbnail))
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(
                    width: Constants.Metric.thumbImageWidth,
                    height: Constants.Metric.thumbImageHeight,
                    alignment: .center
                )
                .background(Color(UIColor.systemBackground))
                .cornerRadius(Constants.Metric.cornerRadius)
                .padding(Constants.Metric.padding)
            Text(video.name)
                .font(.subheadline)
        }
    }
}

