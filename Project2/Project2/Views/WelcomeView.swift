//
//  WelcomeView.swift
//  Project2
//
//  Created by elina on 30.06.2026.
//

import SwiftUI

struct WelcomeView: View {
    @AppStorage("userName") var savedName = ""
    @State var newName = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Привет!")
                .font(.largeTitle)

            TextField("Введите имя", text: $newName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Button("Сохранить") {
                if !newName.isEmpty {
                    savedName = newName
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(newName.isEmpty)

            if !savedName.isEmpty {
                Text("Сохранено: \(savedName)")
                    .foregroundColor(.green)
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}
