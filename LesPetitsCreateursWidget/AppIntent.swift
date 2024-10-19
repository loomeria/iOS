//
//  AppIntent.swift
//  LesPetitsCreateursWidget
//
//  Created by Valentin Vanhove on 19/10/2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Widget", default: "")
    var favoriteEmoji: String
}
