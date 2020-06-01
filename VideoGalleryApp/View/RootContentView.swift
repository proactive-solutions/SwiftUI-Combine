import Combine
import SwiftUI

struct RootContentView: View {

    // MARK: - Observed objects

    @ObservedObject private var viewModel = VideoListViewModel()

    // MARK: - View

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                Text(Constants.Texts.loading)
                    .accessibility(identifier: Constants.AccessibilityIndentifiers.loadingTextIdentifier)
            } else {
                VideosListView(videos: self.viewModel.videos)
                    .navigationBarTitle(Text(Constants.Texts.videos))
            }
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .onAppear(perform: {
            self.viewModel.fetchVideos()
        })
    }
}

