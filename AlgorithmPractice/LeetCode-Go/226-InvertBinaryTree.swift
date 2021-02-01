//
//  226-InvertBinaryTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/18.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 226. 翻转二叉树
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 备注:
 这个问题是受到 Max Howell 的 原问题 启发的 ：

 谷歌：我们90％的工程师使用您编写的软件(Homebrew)，但是您却无法在面试时在白板上写出翻转二叉树这道题，这太糟糕了。

 */

extension Solution {
  static func test226() {
//    let root = Tree.createByRecursion(array: [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
    let root = Tree.createByRecursion(array: [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
//    let root = Tree.createByRecursion(array: [4, 2, 7, 1, 3, 6, 9])
    print(root!.asString)
    
    let newRoot = Self.invertTree(root)
    
    print(newRoot!.asString)
  }
  
  // 递归实现
  private static func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    let left = root.left
    root.left = invertTree(root.right)
    root.right = invertTree(left)
    return root
  }
  
  // 循环实现
  private static func invertTree1(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
      return nil
    }
    
    var queue: [TreeNode] = [root]
    
    while !queue.isEmpty {
      let node = queue.removeFirst()
      
      if let left = node.left,
         let right = node.right {
        node.left = right
        node.right = left
        queue.append(right)
        queue.append(left)
      } else if let left = node.left {
        node.right = left
        node.left = nil
        queue.append(left)
      } else if let right = node.right {
        node.left = right
        node.right = nil
        queue.append(right)
      }
    }
    
    return root
  }
}
