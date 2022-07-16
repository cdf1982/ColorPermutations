//
//  ColorsSelectionView.swift
//  ColorPermutations
//
//  Created by Cesare Forelli on 16/07/22.
//

import SwiftUI


struct ColorsSelectionView: View {
    
    @Binding var colors : [Color]
    
    
    var body: some View {
        
        // I would have expected to be able to use ForEach here, and populate a list with a color picker for each color; but for some reason I don't understand, those color pickers actually returned to the original color before selecting the new color; I believe it's some issue with the Binding I don't understand yet, so for now the approach with the 5 colors below and the hardcoded color pickers must suffice...
        
        let color0 = $colors[0]
        let color1 = $colors[1]
        let color2 = $colors[2]
        let color3 = $colors[3]
        let color4 = $colors[4]
        
        NavigationView {
            
            List {
                
                ColorPicker("First color", selection: color0)
                
                ColorPicker("Second color", selection: color1)
                
                ColorPicker("Third color", selection: color2)
                
                ColorPicker("Fourth color", selection: color3)
                
                ColorPicker("Fifth color", selection: color4)
                
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Color Selection")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}


// I'm not really sure how to handle a preview with a Binding property yet...

//struct ColorsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorsSelectionView()
//    }
//}
