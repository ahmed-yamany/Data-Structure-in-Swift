//
//  Node.swift
//  DataStructuresinSwift
//
//  Created by Ahmed Yamany on 04/10/2022.
//

import Foundation

public class Node<Value>{
    var value: Value
    var next: Node?
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible{
    public var description: String {
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next)) "
    }
    
    
}
