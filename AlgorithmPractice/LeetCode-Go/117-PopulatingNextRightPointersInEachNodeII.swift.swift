//
//  117-PopulatingNextRightPointersInEachNodeII.swift.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/1/23.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test117() {
    let root = Tree.create(tree: [1, 2, 3, 4, 5, nil, 6, 7, nil, nil, nil, nil, nil, nil, 8]
    )
    print(root!.asString)
    let res = connect(root)
    print(res!.asString)
  }

  // 递归解法
  private static func connect(_ root: Node?) -> Node? {
    func _connect(_ root: Node?, _ parentNode: Node?) {
      guard root != nil else { return }
      root?.left?.next = root?.right
      
      var node = parentNode
      
      var nextNode: Node?
      
      while node != nil, nextNode == nil {
        if node?.left != nil, root !== node?.left {
          nextNode = node?.left
        }
        nextNode = node?.right
        node = node?.next
      }
      
      root?.next = node
      
      _connect(root?.left, root)
      _connect(root?.right, root)
    }
    
    _connect(root, nil)
    return root
  }
  
  // 层序遍历解法 与 116 一样
  private static func connect1(_ root: Node?) -> Node? {
    guard let root = root else { return nil }
    
    var currentLevelNods: [Node] = []
    var nextLevelNodes: [Node] = []
    
    var preNode: Node?
    
    currentLevelNods.append(root)
    
    while !currentLevelNods.isEmpty {
      let node = currentLevelNods.removeFirst()
      
      preNode?.next = node
      preNode = node
      
      if let left = node.left {
        nextLevelNodes.append(left)
      }
      
      if let right = node.right {
        nextLevelNodes.append(right)
      }
      
      if currentLevelNods.isEmpty {
        if !nextLevelNodes.isEmpty {
          preNode = nil
          currentLevelNods.append(contentsOf: nextLevelNodes)
          nextLevelNodes.removeAll()
        }
      }
    }
    
    return root
  }
}
