//
//  remindersApp.swift
//  reminders
//
//  Created by Scholar on 6/26/24.
//

import SwiftUI
import SwiftData

@main
struct remindersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
