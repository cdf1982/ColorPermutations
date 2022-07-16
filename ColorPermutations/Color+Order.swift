//
//  Color+Order.swift
//  ColorPermutations
//
//  Created by Cesare Forelli on 16/07/22.
//

import SwiftUI


extension Color {
    
    // Based on https://stackoverflow.com/a/36195290/3765705
            
    var hue: CGFloat {
        
        let uiColor = UIColor(self)
        
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getHue(&hue,
                       saturation: &saturation,
                       brightness: &brightness,
                       alpha: &alpha)
        
        return hue
    }
}
