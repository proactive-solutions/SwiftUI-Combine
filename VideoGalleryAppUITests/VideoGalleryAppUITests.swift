import XCTest
@testable import VideoGalleryApp

class VideoGalleryAppUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testVideloListTap() {
        app.launch()

        let loadingTextDisappear = app.staticTexts[
            Constants.AccessibilityIndentifiers.loadingTextIdentifier
        ]

        let exists = NSPredicate(format: "exists == false")

        let videoListPopulate = expectation(
            for: exists,
            evaluatedWith: loadingTextDisappear,
            handler: nil
        )

        wait(for: [videoListPopulate], timeout: 60, enforceOrder: true)

        // Tap on the first row of the video list
        app.tables.element.cells.element(boundBy: 0).tap()
    }

    func testVideoDetails() {
        testVideloListTap()

        let navigationBarsQuery = app.navigationBars

        // Tap on the download button
         navigationBarsQuery.buttons[
            // AppUIElementTexts.downloadVideo
            Constants.AccessibilityIndentifiers.downloadVideoButtonIdentifier
         ].tap()

        // Check if the download button text changed or not
        XCTAssertFalse(navigationBarsQuery.buttons[
            // AppUIElementTexts.downloadVideo
            Constants.AccessibilityIndentifiers.downloadVideoButtonIdentifier
        ].exists)

        // Check if the video play button is not displaying
        XCTAssertFalse(
            app.buttons[Constants.AccessibilityIndentifiers.playVideoButtonIdentifier].exists
        )

        // Check to make sure video download ProgressBar was shown
        XCTAssertTrue(
            app.staticTexts[
                Constants.AccessibilityIndentifiers.downloadProgressBarIdentifier
            ].exists
        )

        // Check if the button title changed or not
        XCTAssertTrue(navigationBarsQuery.buttons[
            // AppUIElementTexts.cancelDownload
            Constants.AccessibilityIndentifiers.cancelDownloadButtonIdentifier
        ].exists)

        // Tap on the cancel download button
        navigationBarsQuery.buttons[
            // AppUIElementTexts.cancelDownload
            Constants.AccessibilityIndentifiers.cancelDownloadButtonIdentifier
        ].tap()
    }

    func testDownloadProgressAndPlayButtonVisibility() {
        testVideloListTap()

        // Check if the video play button displayed
        XCTAssertTrue(
            app.scrollViews.otherElements.buttons[
                Constants.AccessibilityIndentifiers.playVideoButtonIdentifier
            ].exists
        )

        // Check to make sure video download ProgressBar does not exists
        XCTAssertFalse(
            app.staticTexts[
                Constants.AccessibilityIndentifiers.downloadProgressBarIdentifier
            ].exists
        )
    }

    func testButtonTitleChange() {
        testVideloListTap()

        // Check if the button title changed

        let navigationBarsQuery = app.navigationBars

        XCTAssertFalse(
            navigationBarsQuery.buttons[
                // AppUIElementTexts.cancelDownload
                Constants.AccessibilityIndentifiers.cancelDownloadButtonIdentifier
            ].exists
        )

        // Check if the button title changed
        XCTAssertTrue(
            navigationBarsQuery.buttons[
               // AppUIElementTexts.downloadVideo
                Constants.AccessibilityIndentifiers.downloadVideoButtonIdentifier
            ].exists
        )
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

