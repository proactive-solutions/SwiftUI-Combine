import Foundation
import Combine

@testable import VideoGalleryApp

enum MockedError: Error {
    case anyError
}

class SuccessMockVideosFetcher: VideoFetchable {
    func fetch() -> Future<[Video], Error> {
        return Future { promise in
            //sleep(2)
            print("Response.print")
            promise(.success([Video(
                id: 1,
                name: "",
                thumbnail: "",
                videoDescription: "",
                videoLink: "")]))

        }
    }
}

class FailureMockVideosFetcher: VideoFetchable {
    func fetch() -> Future<[Video], Error> {
        return Future { promise in
            promise(.failure(MockedError.anyError))
        }
    }
}
