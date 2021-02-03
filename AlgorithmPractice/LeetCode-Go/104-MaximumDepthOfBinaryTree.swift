//
//  104-MaximumDepthOfBinaryTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/21.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 104. 二叉树的最大深度
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。
 */

extension Solution {
  
  static func test104() {
    let root = Tree.createByRecursion(array: [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
    print(root!.asString)
    
    print("Depth: \(maxDepth(root))")
  }
  
  // DFS 实现
  private static func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var maxLevel = 0
    func dfs(_ root: TreeNode?, _ level: Int) {
      guard let root = root else { return }
      
      maxLevel = max(level, maxLevel)
      dfs(root.left, level + 1)
      dfs(root.right, level + 1)
    }
    
    dfs(root, 1)
    return maxLevel
  }
  
  // BFS 实现
  private static func maxDepth2(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var currentLevelNodes: [TreeNode] = []
    var nextLevelNodes: [TreeNode] = []
    currentLevelNodes.append(root)
    
    var maxLevel = 0
    
    while !currentLevelNodes.isEmpty {
      let node = currentLevelNodes.removeLast()
      
      if let left = node.left {
        nextLevelNodes.append(left)
      }
      
      if let right = node.right {
        nextLevelNodes.append(right)
      }
      
      if currentLevelNodes.isEmpty {
        maxLevel += 1
        
        if !nextLevelNodes.isEmpty {
          currentLevelNodes.append(contentsOf: nextLevelNodes)
          nextLevelNodes.removeAll()
        }
      }
    }
    
    return maxLevel
  }
  
  // 递归实现
  private static func maxDepth1(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return max(maxDepth1(root.left), maxDepth1(root.right)) + 1
  }
}
