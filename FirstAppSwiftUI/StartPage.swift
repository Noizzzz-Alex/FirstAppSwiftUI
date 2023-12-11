//
//  NewsPage.swift
//  FirstAppSwiftUI
//
//  Created by Александр Харлампов on 11.12.2023.
//

import SwiftUI
struct StartPage: View {
    var body: some View {
            NavigationView {
                VStack {
                    Text("Wellcome")
                        .font(.title)
                    Rectangle()
                        .frame(width: 150, height: 2)
                        .foregroundColor(.black)
                    NavigationLink(destination: ContentView()) {
                        Text("Перейти к новостям")
                    }
                    .navigationBarTitle("Главная страница")
                }
            }
        }
}
                                

#Preview {
    StartPage()
}
