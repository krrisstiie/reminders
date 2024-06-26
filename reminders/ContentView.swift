//
//  ContentView.swift
//  reminders
//
//  Created by Scholar on 6/26/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showNewTask = false
    @Query var toDos: [ToDoItem]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        VStack {
            HStack{
                Text("To Do List")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
                
                Button {
                    withAnimation {
                        self .showNewTask = true
                    }
                    self .showNewTask = true
                } label: {
                    Text("+")
                        .font(.system(size: 40))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
            } // close HStack
            Spacer()
            List {
                ForEach(toDos) {
                    ToDoItem in Text(ToDoItem.title)
                }
                .onDelete(perform: deleteToDo)
            } // close VStack
            if showNewTask {
                NewToDoView(toDoItem: ToDoItem(title: "", isImportant: false), showNewTask: $showNewTask)
            } // close func
        } // close vstack
    } // close body
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
} // close view
    #Preview {
        ContentView()
    }
