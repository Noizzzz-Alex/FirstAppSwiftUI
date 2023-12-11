//
//  ContentView.swift
//  FirstAppSwiftUI
//
//  Created by Александр Харлампов on 09.12.2023.
//
import SwiftUI

struct ContentView: View {
    @State private var newsArray = [News]()
    let formatU = DateFormatter()
    
    var body: some View {
        VStack {
            List(newsArray, id: \.title) { newsItem in
                var newDate: String{
                    formatU.dateFormat = "yyyy-MM-dd"
                    let date = Date(timeIntervalSince1970: TimeInterval(newsItem.publicationDate))
                    return formatU.string(from: date)
                }
                VStack {
                    Text("Date: \(newDate)")
                        .multilineTextAlignment(.center)
                    Rectangle()
                        .frame(width: 150, height: 2)
                        .foregroundColor(.black)
                    Text(newsItem.title)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .font(.system(size: 25))
                    Rectangle()
                        .frame(width: 320, height: 2)
                        .foregroundColor(.black)
                    Text(newsItem.bodyText == "" ? "Sorry, no data available" : newsItem.bodyText)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                    Rectangle()
                        .frame(width: 320, height: 2)
                        .foregroundColor(.black)
                    
                }
            }
        }
        .onAppear {
            NetworkService().getNews { news in
                self.newsArray = news
            }
        }
    }
}


#Preview {
    ContentView()
}
