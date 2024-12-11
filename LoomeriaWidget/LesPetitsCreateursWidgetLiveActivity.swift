//
//  LesPetitsCreateursWidgetLiveActivity.swift
//  LesPetitsCreateursWidget
//
//  Created by Valentin Vanhove on 19/10/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LesPetitsCreateursWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LesPetitsCreateursWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LesPetitsCreateursWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LesPetitsCreateursWidgetAttributes {
    fileprivate static var preview: LesPetitsCreateursWidgetAttributes {
        LesPetitsCreateursWidgetAttributes(name: "World")
    }
}

extension LesPetitsCreateursWidgetAttributes.ContentState {
    fileprivate static var smiley: LesPetitsCreateursWidgetAttributes.ContentState {
        LesPetitsCreateursWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LesPetitsCreateursWidgetAttributes.ContentState {
         LesPetitsCreateursWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LesPetitsCreateursWidgetAttributes.preview) {
   LesPetitsCreateursWidgetLiveActivity()
} contentStates: {
    LesPetitsCreateursWidgetAttributes.ContentState.smiley
    LesPetitsCreateursWidgetAttributes.ContentState.starEyes
}
