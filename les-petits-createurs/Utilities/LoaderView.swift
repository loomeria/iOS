//
//  LoaderView.swift
//  les-petits-createurs
//
//  Created by Valentin Vanhove on 15/10/2024.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .scaleEffect(1.5, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: .black))
    }
}

#Preview {
    LoaderView()
}
