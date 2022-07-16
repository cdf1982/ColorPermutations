//
//  ContentView.swift
//  ColorPermutations
//
//  Created by Cesare Forelli on 16/07/22.
//

import SwiftUI


struct ContentView: View {
    
    let colors : [Color] = [
        .gray,
        .red,
        .green,
        .yellow,
        .blue
    ]
    
    var body: some View {
        
        PatternView(
            rectangle: colors[0],
            largeCircle: colors[1],
            bigCircle: colors[2],
            mediumCircle: colors[3],
            smallCircle: colors[4]
        )
    }
}


struct PatternView: View {
    
    var rectangle : Color
    
    var largeCircle : Color
    
    var bigCircle : Color
    
    var mediumCircle : Color
    
    var smallCircle : Color
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(rectangle)
                .frame(width: 250, height: 250)
            
            Circle()
                .fill(largeCircle)
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(bigCircle)
                .frame(width: 150, height: 150)
            
            Circle()
                .fill(mediumCircle)
                .frame(width: 100, height: 100)
            
            Circle()
                .fill(smallCircle)
                .frame(width: 50, height: 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
