//
//  PermutationsView.swift
//  ColorPermutations
//
//  Created by Cesare Forelli on 16/07/22.
//

import SwiftUI


struct PermutationsView: View {
    
    @State var colors : [Color] = [
        .gray,
        .red,
        .green,
        .yellow,
        .blue
    ]
    
    @State private var showingSheet = false
    
    
    var body: some View {
        
        let permutations = colors.permutations(array: colors).sorted(by: { $0[0].hue >= $1[0].hue })
        
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
                    
                    Text("") // I don't like how close the list is to the Large title without this...
                    
                } footer: {
                    
                    Text("\(permutations.count) permutations from \(colors.count) colors")
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 6, trailing: 0))
                }
            }
            .navigationTitle("Color Permutations")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                
                Button() {
                    
                    for permutation in permutations {
                        
                        let snapshot = PatternView(
                            rectangle: permutation[0],
                            largeCircle: permutation[1],
                            bigCircle: permutation[2],
                            mediumCircle: permutation[3],
                            smallCircle: permutation[4]
                        )
                            .padding()
                            .snapshot()
                        
                        UIImageWriteToSavedPhotosAlbum(snapshot, nil, nil, nil)
                    }
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Button() {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "eyedropper.halffull")
                }
                
                .sheet(isPresented: $showingSheet) {
                    ColorsSelectionView(colors: $colors)
                }
            }
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

struct PermutationsView_Previews: PreviewProvider {
    static var previews: some View {
        PermutationsView()
    }
}
