//
//  LinkedList.swift
//  DataStructuresinSwift
//
//  Created by Ahmed Yamany on 04/10/2022.
//

import Foundation

// a linked list is a chain of nodes.
public struct LinkedList<Value>{
    var head: Node<Value>?  // first node of the list
    var tail: Node<Value>?  // last node of the list
    init(){}
    var isEmpty: Bool{
        head == nil
    }
    
    // MARK: - adding values to list
    // O(1)
    // Adds a value at the front of the list
    mutating func push(_ value: Value){
        self.head = Node(value: value, next: self.head)
        if tail == nil{
            tail = head
        }
    }
    
    // O(1)
    // Adds a value at the end of the list
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
    
    // O(index)
    // Adds a value after a particular node of the list.
    mutating func insert(value: Value, at index: Int) -> Node<Value>{
        let node = self.node(at: index) // get the node at index
        if tail === node{   // if the node is the tail node
            append(value)
            return tail!
        }else{
            node?.next = Node(value: value, next: node?.next)
            return node!.next!
        }
    }
    
    // MARK: - removing values from list
    // O(1)
    // Removes the value at the front of the list
    mutating func pop() -> Value?{
        defer{
            head = head?.next
            if isEmpty{
                tail = nil
            }
        }
        return head?.value
    }
    
    // O(1)
    mutating func removeLast() -> Value?{
        guard let head = head else{ // If head is nil, there’s nothing to remove, so you return nil.
            return nil
        }
        guard head.next != nil else{ // If the list only consists of one node
            return pop()
        }
        
        var previous = head
        var current = head
        
        // Searching for a next node until current.next is nil.
        // This signifies that current is the last node of the list
        while let next = current.next{
            previous = current
            current = next
        }
        // current became the last node
        
        previous.next = nil // disconnect the last node using the previous.next reference.
        tail = previous // update the tail reference
        return current.value
    }
    
    // O(index)
    mutating func remove(after index: Int) -> Value?{
        let node = self.node(at: index)
        defer{
            if node?.next === tail{
                tail = node
            }
            node?.next = node?.next?.next
        }
        return node?.next?.value
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
