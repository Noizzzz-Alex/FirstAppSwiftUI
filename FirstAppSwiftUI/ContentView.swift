//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by Александр Харлампов on 09.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var color: ObservableColor

    var body: some View {
        VStack {
            Text("Светофор")
            HStack {
                RowSquare(section: color)
            }
        }
        VStack {
            Button("Change color") {
                switch color.color {
                case .red:
                    color.color = .yellow
                case .yellow:
                    color.color = .green
                case .green:
                    color.color = .red
                }
        
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

enum TraficLight {
    case red, yellow, green
}

final class ObservableColor: ObservableObject {
    @Published var color: TraficLight = .red
}

struct RowSquare: View {
    @ObservedObject var section = ObservableColor()

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(section.color == .red ? .red : .white)
                .border(.red, width: 3)
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(section.color == .yellow ? .yellow : .white)
                .border(.yellow, width: 3)
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundStyle(section.color == .green ? .green : .white)
                .border(.green, width: 3)
        }
    }
}

#Preview {
    ContentView(color: ObservableColor())
}
