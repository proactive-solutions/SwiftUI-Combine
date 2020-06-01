### swiftui-videos
Sample app which loads list of videos on the list and displays the details of the selected videos.

### Architecture
- MVVM design pattern.
- Combine framework

### Components of the application

##### ViewModels
- VideoDetailsViewModel
- VideoListViewModel

##### Data Model
- Video(Represents VideoList API Response)

##### Views
- RootContentView (Root view of the application. Created with application launch)
- VideosListView (Displays list of videos in a ListView)
- VideoDescriptionView (Displays video title and description)
- VideoDetailView (Contains VideoDescriptionView andd VideoPreview)
- AVPlayerView(Plays video with AVPlayer)
- VideoPreview (Displays video thumbnail and allow playing video)
- VideoThumbView (Displayed on the ListView. Contains video thumbnail and video title. On tap navigates to VideoDetailView)

##### Helpers 
- DownloadWorker (Downloads video and saves in the application document directory)
- VideoFetchHandler(Responsible for calling video list API and parse JSON response)

### Build and runtime requirements
- iOS 13.0 or higher
- Xcode 11.4.1
- Swift 5.0, SwiftUI, Combine
- CococaPods

### Third-party dependencies:
- SDWebImageView
- Alamofire
