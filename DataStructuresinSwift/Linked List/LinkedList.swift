//
//  LinkedList.swift
//  DataStructuresinSwift
//
//  Created by Ahmed Yamany on 04/10/2022.
//

import Foundation

public struct LinkedList<Value>{
    var head: Node<Value>?
    var tail: Node<Value>?
    init(){}
    var isEmpty: Bool{
        head == nil
    }
    
    // O(1)
    mutating func push(_ value: Value){
        self.head = Node(value: value, next: self.head)
        if tail == nil{
            tail = head
        }
    }
    // O(1)
    mutating func append(_ value: Value){
        if isEmpty{
            push(value)
        }else{
            let node =  Node(value: value)
            tail?.next = node
            tail = node
        }
    }
    // O(index)
    func node(at index: Int) -> Node<Value>?{
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index{
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    // O(index) + 1
    mutating func insert(value: Value, at index: Int) -> Node<Value>{
        let node = self.node(at: index)
        if tail === node{
            append(value)
            return tail!
        }else{
            node?.next = Node(value: value, next: node?.next)
            return node!.next!
        }
    }
}

extension LinkedList: CustomStringConvertible{
    public var description: String{
        guard let head = head else{
            return "Empty List"
        }
        
        return String(describing: head)
    }
}
