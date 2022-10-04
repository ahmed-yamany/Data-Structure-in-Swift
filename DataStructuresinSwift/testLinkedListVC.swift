//
//  ViewController.swift
//  DataStructuresinSwift
//
//  Created by Ahmed Yamany on 04/10/2022.
//

import UIKit

class testLinkedListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let node1 = Node(value: 5)
        let node2 = Node(value: 6)
        let node3 = Node(value: 7)
        
        node1.next = node2
        node2.next = node3
        
        print(node1)
    }


}

