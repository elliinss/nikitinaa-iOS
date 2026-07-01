//
//  MainView.swift
//  Project2
//
//  Created by elina on 30.06.2026.
//

import SwiftUI

struct MainView: View {
    @AppStorage("userName") var savedName = ""
    @Environment(MoodViewModel.self) var viewModel
    @State var showAddMood = false

    var body: some View {
        NavigationStack {
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
                        ForEach(viewModel.filteredEntries) { entry in
                            NavigationLink(value: entry.mood) {
                                Text(entry.mood)                      
                                    .font(.largeTitle)
                            }
                        }
                        .onDelete { indexSet in
                            viewModel.delete(at: indexSet)
                        }
                    }
                    .frame(height: 250)
                }

                Button("Выйти") {
                    savedName = ""
                }
                .buttonStyle(.bordered)

                Spacer()
            }
            .padding()
            .navigationTitle("Настроения")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: Bindable(viewModel).searchText)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Добавить") {
                        showAddMood = true
                    }
                }
            }
            .sheet(isPresented: $showAddMood) {
                AddMoodView()
                    .environment(viewModel)
            }
            .navigationDestination(for: String.self) { mood in
                MoodDetailView(mood: mood)
            }
        }
    }
}

#Preview {
    MainView()
        .environment(MoodViewModel())
}
