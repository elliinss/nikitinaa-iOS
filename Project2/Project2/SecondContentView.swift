//
//  SecondContentView.swift
//  Project1
//  Created by elina on 30.06.2026.
//

import SwiftUI

struct SecondContentView: View {
    @AppStorage("userName") var savedName = ""
    @State var viewModel = MoodViewModel()
    
    var body: some View {
        if savedName == "" {
            WelcomeView()
        } else {
            MainView()
                .environment(viewModel)
        }
    }
}

#Preview {
    SecondContentView()
}
