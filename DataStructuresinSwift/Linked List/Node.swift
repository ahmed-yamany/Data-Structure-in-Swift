//
//  Node.swift
//  DataStructuresinSwift
//
//  Created by Ahmed Yamany on 04/10/2022.
//

import Foundation

public class Node<Value>{
    // Nodes have two responsibilities:
    var value: Value    // Hold a value.
    var next: Node?     // Hold a reference to the next node. A nil value represents the end of the list
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
