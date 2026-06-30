//
//  MainView.swift
//  Project1
//  Created by elina on 30.06.2026.
//

import SwiftUI

struct MainView: View {
    @AppStorage("userName") var savedName = ""
    @Environment(MoodViewModel.self) var viewModel
    @State var showAddMood = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Привет, \(savedName)!")
                .font(.largeTitle)
            
            Text("Мои настроения:")
                .font(.title2)
            
            if viewModel.entries.isEmpty {
                Text("Пока нет записей")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(viewModel.entries, id: \.self) { mood in
                        HStack {
                            Text(mood)
                                .font(.largeTitle)
                        }
                    }
                    .onDelete { indexSet in
                        if let index = indexSet.first {
                            viewModel.delete(at: index)
                        }
                    }
                }
                .frame(height: 250)
            }
            
            Button("Добавить настроение") {
                showAddMood = true
            }
            .buttonStyle(.borderedProminent)
            
            Button("Выйти") {
                savedName = ""
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showAddMood) {
            AddMoodView()
                .environment(viewModel)
        }
    }
}

#Preview {
    MainView()
        .environment(MoodViewModel())
}
