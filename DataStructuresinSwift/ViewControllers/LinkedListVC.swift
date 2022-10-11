//
//  ViewController.swift
//  DataStructuresinSwift
//
//  Created by Ahmed Yamany on 04/10/2022.
//

import UIKit

class LinkedListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let node1 = Node(value: 5)
        let node2 = Node(value: 6)
        let node3 = Node(value: 7)
        
        node1.next = node2
        node2.next = node3
        
        print(node1)
        
        
        
        var list = LinkedList<Int>()
        list.push(6)
        list.push(7)
        list.push(8)
        
        print(list)
        list.append(9)
        list.append(10)
        print(list)
        list.insert(value: 5, at: 3)
        print(list)
        
        
//        list.pop()
        list.remove(at: 3)
        print(list)
        
    }


}

