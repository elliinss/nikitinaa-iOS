//
//  MoodViewModel.swift
//  Project1
//  Created by elina on 30.06.2026.
//

import Foundation

@Observable
class MoodViewModel {
    var entries: [String] = []
    
    func add(_ mood: String) {
        entries.append(mood)
    }
    
    func delete(at index: Int) {
        entries.remove(at: index)
    }
}
