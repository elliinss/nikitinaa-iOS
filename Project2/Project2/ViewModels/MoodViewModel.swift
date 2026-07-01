//
//  MoodViewModel.swift
//  Project2
//
//  Created by elina on 30.06.2026.
//

import Foundation
import SwiftUI

@Observable
final class MoodViewModel {
    var entries: [MoodModel] = []
    var searchText = ""

    var filteredEntries: [MoodModel] {
        if searchText.isEmpty {
            return entries
        }
        return entries.filter { $0.mood.localizedCaseInsensitiveContains(searchText) }
    }

    func add(_ mood: String) {
        let newEntry = MoodModel(mood: mood, date: Date(), note: nil)
        entries.append(newEntry)
    }

    func delete(at index: Int) {
        entries.remove(at: index)
    }

    func delete(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }
}
