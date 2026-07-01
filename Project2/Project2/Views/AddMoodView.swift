//
//  AddMoodView.swift
//  Project2
//
//  Created by elina on 30.06.2026.
//

import SwiftUI

struct AddMoodView: View {
    @Environment(MoodViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    @State var selectedMood = "😊"

    let moods = ["😊", "🙂", "😐", "😔", "😢"]

    var body: some View {
        NavigationStack {
            Form {
                Section("Выбери настроение") {
                    MoodPicker(selectedMood: $selectedMood)
                }

                Section {
                    Button("Сохранить") {
                        viewModel.add(selectedMood)
                        dismiss()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.blue)
                }
            }
            .navigationTitle("Новая запись")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") { dismiss() }
                }
            }
        }
    }
}

#Preview {
    AddMoodView()
        .environment(MoodViewModel())
}
