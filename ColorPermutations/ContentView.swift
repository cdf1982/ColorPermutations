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
        
        let permutations = colors.permutations(array: colors)
        
        let firstPermutation = permutations.first!
        
        let secondPermutation = permutations[1]
        
        VStack {
            
            PatternView(
                rectangle: firstPermutation[0],
                largeCircle: firstPermutation[1],
                bigCircle: firstPermutation[2],
                mediumCircle: firstPermutation[3],
                smallCircle: firstPermutation[4]
            )
            
            PatternView(
                rectangle: secondPermutation[0],
                largeCircle: secondPermutation[1],
                bigCircle: secondPermutation[2],
                mediumCircle: secondPermutation[3],
                smallCircle: secondPermutation[4]
            )
        }
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
