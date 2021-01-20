//
//  102-BinaryTreeLevelOrderTraversal.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/20.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test102() {
    let root = Tree.createByRecursion(array: [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
    print(root!.asString)
    print(Self.levelOrder(root))
  }
  
  // DFS
  private static func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var result: [[Int]] = []
    
    func DFS(_ level: Int, _ root: TreeNode?) {
      guard let root = root else { return }
      
      if level >= result.count {
        [0 ... (level - result.count)].forEach { _ in
          result.append([Int]())
        }
      }
      
      result[level].append(root.val)
      DFS(level + 1, root.left)
      DFS(level + 1, root.right)
    }
    
    DFS(0, root)
    return result
  }
  
  // BFS
  private static func levelOrder1(_ root: TreeNode?) -> [[Int]] {
    var result: [[Int]] = []
    
    guard let root = root else {
      return result
    }
    
    var currentLevelNodes: [TreeNode] = []
    var nextLevelNodes: [TreeNode] = []
    var levelResult: [Int] = []
    currentLevelNodes.append(root)
    
    while !currentLevelNodes.isEmpty {
      let node = currentLevelNodes.removeFirst()
      if let left = node.left {
        nextLevelNodes.append(left)
      }
      if let right = node.right {
        nextLevelNodes.append(right)
      }
      levelResult.append(node.val)
      
      if currentLevelNodes.isEmpty {
        if !nextLevelNodes.isEmpty {
          currentLevelNodes.append(contentsOf: nextLevelNodes)
          nextLevelNodes.removeAll()
        }
        result.append(levelResult)
        levelResult.removeAll()
      }
    }
    
    return result
  }
}
