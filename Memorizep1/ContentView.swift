//
//  ContentView.swift
//  Memorizep1
//
//  Created by Thomas Ostrander on 10/28/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var emojis: Array<String> = []
    
    var halloween = ["👻","🎃","💀","👺","🕸️","🐮","🐷", "👻","🎃","💀","👺","🕸️","🐮","🐷"]
    
    var transportation = ["🚕","🚔","🚍","🚚"," 🚒","🚜","🛵","🛻","🚕","🚔","🚍","🚚"," 🚒","🚜","🛵","🛻"]
    
    var food = ["🍔","🌮","🍕","🍗","🥓","🍰","🧁","🍓","🍔","🌮","🍕","🍗","🥓","🍰","🧁","🍓","🌯","🍱","🌯","🍱"]
    
    @State var cardCount = 0
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(0..<cardCount, id: \.self) { index in
                        CardView(content: emojis[index])
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.orange)
            }
            HStack(spacing:40) {
               themeButton(themeName: "halloween", theme: halloween, symbol: "moonphase.full.moon")
               themeButton(themeName: "transportation", theme: transportation, symbol: "moonphase.first.quarter")
               themeButton(themeName: "food", theme: food, symbol: "cloud.snow")
            }
            .padding()
        }
        .padding()
    }
    
    
    func themeButton(themeName: String, theme: Array<String>, symbol: String) -> some View {
        VStack {
            Image(systemName: symbol)
                .font(.largeTitle)
            Button(themeName) {
                emojis = theme.shuffled()
                cardCount = theme.count
            }
        }
    }
    
    struct CardView: View {
        
        @State var isFaceUp = false
        let content: String
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
                
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
#Preview {
    ContentView()
}


