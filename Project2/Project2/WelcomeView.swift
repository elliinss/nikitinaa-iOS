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
        VStack {
            Text("Привет!")
                .font(.largeTitle)
            
            TextField("Введите имя", text: $newName)
                .textFieldStyle(.roundedBorder)
            
            Button("Сохранить") {
                savedName = newName
            }
            .buttonStyle(.borderedProminent)
            
            Text(savedName)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    WelcomeView()
}

