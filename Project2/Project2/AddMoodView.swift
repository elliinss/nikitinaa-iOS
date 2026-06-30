//
//  AddMoodView.swift
//  Project1
//  Created by elina on 30.06.2026.
//

import SwiftUI

struct AddMoodView: View {
    @Environment(MoodViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    @State var selectedMood = "😊"
    
    let moods = ["😊", "🙂", "😐", "😔", "😢"]
    
    var body: some View {
        VStack {
            Text("Выбери настроение")
                .font(.largeTitle)
                .padding()
            
            HStack {
                ForEach(moods, id: \.self) { mood in
                    Button(mood) {
                        selectedMood = mood
                    }
                    .font(.system(size: 45))
                }
            }
            
            Text("Выбрано: \(selectedMood)")
                .font(.title2)
                .padding()
            
            Button("Сохранить") {
                viewModel.add(selectedMood)
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddMoodView()
        .environment(MoodViewModel())
}
