/*
 Code for this ProgressBar is taken from this blog post.
 https://www.ioscreator.com/tutorials/swiftui-circular-progress-bar-tutorial
 */

import SwiftUI

struct ProgressBar: View {

    // MARK: - Properties

    let value: Double

    // MARK: - View

    var body: some View {
        ZStack {
            // 3.
            Circle()
                .stroke(Color(UIColor.systemGray), lineWidth: Constants.Metric.circularProgressLineWidth)
                .opacity(0.1)
            // 4.
            Circle()
                .trim(from: 0, to: CGFloat(value))
                .stroke(Color(UIColor.systemBlue), lineWidth: Constants.Metric.circularProgressLineWidth)
                .rotationEffect(.degrees(-90))
                // 5.
                .overlay(
                    Text("\(Int(value * 100.0))%"))
        }
    }
}
