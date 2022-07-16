//
//  Array+Permutations.swift
//  ColorPermutations
//
//  Created by Cesare Forelli on 16/07/22.
//
//  Source [ObjC Functional Snippet #10: Permutations](https://www.objc.io/blog/2014/12/08/functional-snippet-10-permutations/), with minor language updates


import Foundation


extension Array {
    
    func decompose() -> (Iterator.Element, [Iterator.Element])? {
        
        guard let element = first else { return nil }
        
        return (element, Array(self[1..<count]))
    }
    
    
    func between<T>(element: T, _ array: [T]) -> [[T]] {
        
        guard let (head, tail) = array.decompose() else { return [[element]] }
        
        return [[element] + array] + between(element: element, tail).map { [head] + $0 }
    }
    
    
    func permutations<T>(array: [T]) -> [[T]] {
        
        guard let (head, tail) = array.decompose() else { return [[]] }
        
        return permutations(array: tail).flatMap { between(element: head, $0) }
    }
}
