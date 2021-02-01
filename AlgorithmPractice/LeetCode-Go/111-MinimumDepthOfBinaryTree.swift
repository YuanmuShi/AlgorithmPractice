//
//  111-MinimumDepthOfBinaryTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/21.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 111. 二叉树的最小深度
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明：叶子节点是指没有子节点的节点。

  

 示例 1：


 输入：root = [3,9,20,null,null,15,7]
 输出：2
 示例 2：

 输入：root = [2,null,3,null,4,null,5,null,6]
 输出：5
  

 提示：

 树中节点数的范围在 [0, 105] 内
 -1000 <= Node.val <= 1000
 */

extension Solution {
  static func test111() {
//    let root = Tree.createByRecursion(array: [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
//    let root = Tree.createByRecursion(array: [3, 9, 20, nil, nil, 15, 7])
//    let root = Tree.createByRecursion(array: [1, 2, 3, 4, 5])
    let root = Tree.createByRecursion(array: [1, 1])
//    print(root!.asString)
    
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
    guard let root = root else { return 0 }
    
    if root.left != nil, root.right != nil {
      return min(minDepth(root.left), minDepth(root.right)) + 1
    } else if root.left != nil {
      return minDepth(root.left) + 1
    } else if root.right != nil {
      return minDepth(root.right) + 1
    } else {
      return 1
    }
  }
}
