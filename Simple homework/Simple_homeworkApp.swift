//
//  Simple_homeworkApp.swift
//  Simple homework
//
//  Created by Павел Пономарёв on 02.09.2023.
//

import SwiftUI

@main
struct Simple_homeworkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(EnvironmentViewModel())
        }
    }
}
