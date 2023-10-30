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
            HStack {
                VStack {
                    Image(systemName: "moonphase.full.moon")
                        .font(.largeTitle)
                    Button("Halloween") {
                        emojis = halloween.shuffled()
                        cardCount = emojis.count
                    }
                }
                VStack {
                    Image(systemName: "moonphase.full.moon")
                        .font(.largeTitle)
                    Button("Transportation") {
                        emojis = transportation.shuffled()
                        cardCount = transportation.count
                    }
                }
                VStack {
                    Image(systemName: "moonphase.first.quarter")
                        .font(.largeTitle)
                    Button("Food") {
                        emojis = food.shuffled()
                        cardCount = food.count
                    }
                }
            }
            .padding()
        }
        .padding()
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
                    
                    
    
    
 
    
    


        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
#Preview {
    ContentView()
}
