import Combine
import Foundation

final class VideoListViewModel: ObservableObject {

    //  MARK: - Observable Properties

    @Published private(set) var isLoading = false
    @Published private(set) var videos = [Video]() {
        didSet {
            isLoading = false
        }
    }

    //  MARK: - Properties

    var worker: VideoFetchable = VideoFetchHandler()

    //  MARK: - Private properties

    private var cancellable: AnyCancellable?

    //  MARK: - Functions

    func fetchVideos(
        onSuccess: (() -> Void)? = nil,
        onFailure: (() -> Void)? = nil,
        onCompletion: (() -> Void)? = nil
    ) {
        isLoading = true
        cancellable = worker
            .fetch()
            .sink(receiveCompletion: { result in
                switch result {
                case let .failure(error):
                    print(error.localizedDescription)
                    onFailure?()
                case .finished:
                    onCompletion?()
                }
            }, receiveValue: { videos in
                self.videos = videos
                onSuccess?()
            })
    }
}

