//
//  RootView.swift
//  Project2
//
//  Created by elina on 01.07.2026.
//

import SwiftUI

struct RootView: View {
    @AppStorage("userName") var savedName = ""
    @State private var viewModel = MoodViewModel()
    
    var body: some View {
        if savedName.isEmpty {
            WelcomeView()
        } else {
            MainView()
                .environment(viewModel)
        }
    }
}

#Preview {
    RootView()
}
