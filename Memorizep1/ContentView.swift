//
//  ContentView.swift
//  Memorizep1
//
//  Created by Thomas Ostrander on 10/28/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var emojis = ["👻","🎃","💀","👺","🕸️","🐮","🐷","🐻", "👻","🎃","💀","👺","🕸️","🐮","🐷","🐻"]
    
    var transportation = [""]
    
    var food = [""]
    
    @State var cardCount = 16
    
    var body: some View {
        VStack {
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
                        
                    }
                }
                VStack {
                    Image(systemName: "moonphase.full.moon")
                        .font(.largeTitle)
                    Button("Transportation") {
                        
                    }
                }
                VStack {
                    Image(systemName: "moonphase.first.quarter")
                        .font(.largeTitle)
                    Button("Food") {
                        
                    }
                }
                
            }
            .padding()
        }
        .padding()
    }
    
}

struct CardView: View {
    
    @State var isFaceUp = true
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
