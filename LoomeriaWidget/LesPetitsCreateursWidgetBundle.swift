//
//  LesPetitsCreateursWidgetBundle.swift
//  LesPetitsCreateursWidget
//
//  Created by Valentin Vanhove on 19/10/2024.
//

import WidgetKit
import SwiftUI

@main
struct LesPetitsCreateursWidgetBundle: WidgetBundle {
    var body: some Widget {
        LesPetitsCreateursWidget()
        LesPetitsCreateursWidgetControl()
        LesPetitsCreateursWidgetLiveActivity()
    }
}
