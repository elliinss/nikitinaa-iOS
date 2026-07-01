//
//  MoodModel.swift
//  Project2
//
//  Created by elina on 01.07.2026.
//

import Foundation

struct MoodModel: Identifiable, Hashable {
    let id = UUID()
    let mood: String
    let date: Date
    let note: String?

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: date)
    }
}
