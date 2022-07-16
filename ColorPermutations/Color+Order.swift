//
//  Color+Order.swift
//  ColorPermutations
//
//  Created by Cesare Forelli on 16/07/22.
//

import SwiftUI


extension Color {
    
    var order : Int {
        
        get {
            
            switch self {
                
            case .gray:
                return 1
            case .red:
                return 2
            case .green:
                return 3
            case .yellow:
                return 4
            case .blue:
                return 5
            default:
                return 0
            }
        }
    }
}
