import XCTest
import Combine

@testable import VideoGalleryApp

class VideoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVideo() throws {
        guard let url = Bundle(for: VideoTests.self).url(forResource: "videos", withExtension: "json")
            else { fatalError("Can't find videos.json file") }

        let data = try Data(contentsOf: url)
        let videoResponse = try JSONDecoder().decode(VideoFetchHandler.VideosResponse.self, from: data)
        let videos = videoResponse.videos

        // Check videos object is not nil
        XCTAssertNotNil(videos)
        // Check if the videos array is not empty
        XCTAssertFalse(videos.isEmpty)
        // Check if the count of videos array is 14
        XCTAssertEqual(videos.count, 14)

        // Check the first object of videos for all the attributes
        let firstVideo = videos.first!
        XCTAssertEqual(firstVideo.id, 950)
        XCTAssertEqual(firstVideo.name, "How To Hold Your iPhone When Taking Photos")
        XCTAssertEqual(firstVideo.thumbnail, "https://i.picsum.photos/id/477/2000/2000.jpg")
        XCTAssertEqual(firstVideo.videoDescription, "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        XCTAssertEqual(firstVideo.videoLink, "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")
    }

    func testVideoListSuccess() {
        let vm = VideoListViewModel()
        let expectationVideos = expectation(description: "Videos will be fetched.")

        XCTAssertFalse(vm.isLoading)
        XCTAssertTrue(vm.videos.isEmpty)

        vm.worker = SuccessMockVideosFetcher()

        vm.fetchVideos(onSuccess: {
            expectationVideos.fulfill()
        })

        waitForExpectations(timeout: 30)

        XCTAssertFalse(vm.videos.isEmpty)
        XCTAssertFalse(vm.isLoading)
    }

    func testVideoListFailure() {
        let vm = VideoListViewModel()
        let expectationError = expectation(description: "Videos will not be fetched.")

        XCTAssertFalse(vm.isLoading)
        XCTAssertTrue(vm.videos.isEmpty)

        vm.worker = FailureMockVideosFetcher()

        vm.fetchVideos(onFailure: {
            expectationError.fulfill()
        })

        waitForExpectations(timeout: 30)

        XCTAssertTrue(vm.videos.isEmpty)
        XCTAssertTrue(vm.videos.isEmpty)
    }

    func testVideoDownloadSuccess() {
        let vm = VideoDetailsViewModel()
        XCTAssertTrue(vm.videoStatus == .notDownloaded)
    }

    func testVideoDownloadFailure() {
        let vm = VideoDetailsViewModel()
        XCTAssertTrue(vm.videoStatus == .notDownloaded)
    }
}

