//
//  111-MinimumDepthOfBinaryTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/21.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test111() {
//    let root = Tree.createByRecursion(array: [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
//    let root = Tree.createByRecursion(array: [3, 9, 20, nil, nil, 15, 7])
//    let root = Tree.createByRecursion(array: [1, 2, 3, 4, 5])
    let root = Tree.createByRecursion(array: [1, 1])
    print(root!.asString)
    
    print("Depth: \(minDepth(root))")
  }
  
  // DFS 实现
  private static func minDepth1(_ root: TreeNode?) -> Int {
    var minLevel: Int?
    func dfs(_ root: TreeNode?, _ level: Int) {
      guard let root = root else { return }
      
      if root.left == nil, root.right == nil {
        if let tmp = minLevel {
          minLevel = min(tmp, level)
        } else {
          minLevel = level
        }
      }
      dfs(root.left, level + 1)
      dfs(root.right, level + 1)
    }
    
    dfs(root, 1)
    return minLevel ?? 0
  }
  
  // BFS 实现
  private static func minDepth2(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var currentLevelNodes: [TreeNode] = []
    var nextLevelNodes: [TreeNode] = []
    currentLevelNodes.append(root)
    
    var minLevel = 0
    
    while !currentLevelNodes.isEmpty {
      let node = currentLevelNodes.removeLast()
      
      if node.left == nil, node.right == nil {
        minLevel += 1
        break
      }
      
      if let left = node.left {
        nextLevelNodes.append(left)
      }
      
      if let right = node.right {
        nextLevelNodes.append(right)
      }
      
      if currentLevelNodes.isEmpty {
        minLevel += 1
        
        if !nextLevelNodes.isEmpty {
          currentLevelNodes.append(contentsOf: nextLevelNodes)
          nextLevelNodes.removeAll()
        }
      }
    }
    
    return minLevel
  }
  
  // 递归实现
  private static func minDepth(_ root: TreeNode?) -> Int {
    // TODO: [1, 1] 用例未过
    guard let root = root else { return 0 }
    return min(minDepth(root.left), minDepth(root.right)) + 1
  }
}
