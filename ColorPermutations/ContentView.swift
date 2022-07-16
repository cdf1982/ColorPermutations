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
        
        NavigationView {
            
            List {
                
                Section {
                    
                    ForEach(permutations, id: \.self) { permutation in
                        
                        HStack {
                            
                            Spacer()
                            
                            PatternView(
                                rectangle: permutation[0],
                                largeCircle: permutation[1],
                                bigCircle: permutation[2],
                                mediumCircle: permutation[3],
                                smallCircle: permutation[4]
                            )
                            .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                            
                            Spacer()
                        }
                        .listRowSeparator(.hidden)
                    }
                    
                } header: {
                    
                    let colorsList = colors.description
                        .replacingOccurrences(of: "[", with: "")
                        .replacingOccurrences(of: "]", with: "")
                    
                    Text("Results for \(colorsList)")
                        .padding(EdgeInsets(top: 6, leading: 0, bottom: 0, trailing: 0))
                    
                } footer: {
                    
                    Text("\(permutations.count) permutations from \(colors.count) hardcoded colors")
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 6, trailing: 0))
                }
            }
            .navigationTitle("Color Permutations")
            .navigationBarTitleDisplayMode(.large)
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
