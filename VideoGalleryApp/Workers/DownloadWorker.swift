import Alamofire
import Foundation

protocol VideoDownloadable {
    var url: String? { get }
    var progressCallback: ((Double) -> Void)? { get }
    var response: ((AFDownloadResponse<URL?>) -> Void)? { get }
    var downloadRequest: Alamofire.DownloadRequest? { get }

    func start(
           url: String,
           progressCallback: @escaping (Double) -> Void,
           response: @escaping (AFDownloadResponse<URL?>) -> Void
       )
    func stop()
}

final class DownloadWorker: VideoDownloadable {

    //  MARK: - Private properties

   var url: String?
   var progressCallback: ((Double) -> Void)?
   var response: ((AFDownloadResponse<URL?>) -> Void)?
   var downloadRequest: Alamofire.DownloadRequest?

    //  MARK: - Methods

    /// Cancels current downloading task
    func stop() {
        downloadRequest?.cancel()
    }

    /// Downloads and saves the video in appliction's Document directory
    func start(
        url: String,
        progressCallback: @escaping (Double) -> Void,
        response: @escaping (AFDownloadResponse<URL?>) -> Void
    ) {

            self.url = url
               self.progressCallback = progressCallback
               self.response = response
        stop()
        guard let fileName = url.components(separatedBy: "/").last else {
            fatalError(Constants.ErrorMessages.fileNameCreationFailed)
        }

        let destination: DownloadRequest.Destination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent(fileName)

            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }

        downloadRequest = AF.download(url, to: destination)
            .downloadProgress { [weak self] progress in
                self?.progressCallback?(progress.fractionCompleted)
            }
            .response { [weak self] downloadResponse in
                self?.response?(downloadResponse)
            }
    }
}
