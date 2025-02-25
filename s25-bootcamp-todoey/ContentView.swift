//
//  ContentView.swift
//  s25-bootcamp-todoey
//
//  Created by Ethan Tran on 2/24/25.
import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    @State private var todos: [Todo] = []

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    Text("Todoey")
                        .font(.custom("Helvetica Neue", size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                }

                VStack {
                    if todos.isEmpty {
                        VStack {
                            Image(systemName: "note.text")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white.opacity(0.8))
                            Text("No todos yet!")
                                .font(.title2)
                                .foregroundColor(.white.opacity(0.8))
                                .padding(.top, 10)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .multilineTextAlignment(.center)
                        .transition(.opacity)
                    } else {
                        List {
                            ForEach($todos) { $todo in
                                HStack {
                                    TextField("Enter Todo", text: $todo.item)
                                        .padding(.vertical, 8)
                                        .background(Color.clear)

                                        .strikethrough(todo.isDone)
                                    
                                    Toggle(isOn: $todo.isDone) {
                                    }
                                    .padding(.trailing, 8)
                                    .frame(height: 30)
                                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                                }
                                .listRowBackground(Color.white.opacity(0.7))
                            }
                            .onDelete { indexSet in
                                todos.remove(atOffsets: indexSet)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .background(Color.clear)
                        .listRowBackground(Color.clear)
                    }
                }

                HStack {
                    Button(action: {
                        withAnimation {
                            todos.append(Todo(item: "", isDone: false))
                        }
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                    Button("New Todo") {
                        withAnimation {
                            todos.append(Todo(item: "", isDone: false))
                        }
                    }
                    .font(.title2)
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
