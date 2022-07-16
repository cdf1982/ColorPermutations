//
//  ContentView.swift
//  ColorPermutations
//
//  Created by Cesare Forelli on 16/07/22.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(.gray)
                .frame(width: 250, height: 250)
            
            Circle()
                .fill(.red)
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(.green)
                .frame(width: 150, height: 150)
            
            Circle()
                .fill(.yellow)
                .frame(width: 100, height: 100)
            
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
