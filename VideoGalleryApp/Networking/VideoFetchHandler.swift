import Alamofire
import Combine

protocol VideoFetchable {
    func fetch() -> Future<[Video], Error>
}

final class VideoFetchHandler: VideoFetchable {

    //  MARK: - Decodable Response Structs

    struct VideosResponse: Codable {
        let videos: [Video]
    }

    //  MARK: - Functions

    /// Fethes video list from the API
    /// - Returns: Future with JSON data or an Error
    func fetch() -> Future<[Video], Error> {
        return Future { promise in
            AF.request(
                EndPoints.videos,
                method: .get
            )
            .responseDecodable { (response: DataResponse<VideosResponse, AFError>) in
                if let value = response.value {
                    promise(.success(value.videos))
                } else if let error = response.error {
                    promise(.failure(error))
                }
            }
        }
    }
}

