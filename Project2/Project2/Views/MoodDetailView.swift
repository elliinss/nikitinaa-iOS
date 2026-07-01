//
//  MoodDetailView.swift
//  Project2
//
//  Created by elina on 01.07.2026.
//

import SwiftUI

struct MoodDetailView: View {
    let mood: String

    var body: some View {
        VStack(spacing: 30) {
            Text(mood)
                .font(.system(size: 100))

            SectionCard(title: "Информация") {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Настроение: \(mood)")
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top, 40)
        .navigationTitle("Детали")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MoodDetailView(mood: "😊")
}
