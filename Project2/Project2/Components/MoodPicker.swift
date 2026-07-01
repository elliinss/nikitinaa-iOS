//
//  MoodPicker.swift
//  Project2
//
//  Created by elina on 01.07.2026.
//

import SwiftUI

struct MoodPicker: View {
    @Binding var selectedMood: String

    let moods = ["😊", "🙂", "😐", "😔", "😢"]

    var body: some View {
        HStack {
            ForEach(moods, id: \.self) { mood in
                Button {
                    selectedMood = mood
                } label: {
                    Text(mood)
                        .font(.system(size: 45))
                        .padding(8)
                        .background(
                            Circle()
                                .fill(selectedMood == mood ? Color.blue.opacity(0.2) : Color.clear)
                        )
                }
            }
        }
    }
}

#Preview {
    MoodPicker(selectedMood: .constant("😊"))
}
