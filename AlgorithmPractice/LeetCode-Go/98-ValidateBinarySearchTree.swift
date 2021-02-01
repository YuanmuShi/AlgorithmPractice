//
//  98-ValidateBinarySearchTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/17.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 98. 验证二叉搜索树
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。
 */

extension Solution {
  static func test98() {
    // [5, 1, 4, nil, nil, 3, 6]
    // [5, 4, 6, nil, nil, 3, 7]
    // [1, 1]
    let tree = Tree.create(tree: [5, 4, 6, nil, nil, 3, 7])
    print(tree!.asString)
    print("\(isValidBST2(tree))")
  }

  // 中序遍历后判断是否是自增
  private static func isValidBST1(_ root: TreeNode?) -> Bool {
    var result: [Int?] = []
    
    func midOrder(_ root: TreeNode?) {
      guard let root = root else { return }
      midOrder(root.left)
      result.append(root.val)
      midOrder(root.right)
    }
    
    midOrder(root)
    
    let tmpResult = result.compactMap { $0 }
    
    var index = 0
    while index + 1 < tmpResult.count {
      if tmpResult[index + 1] <= tmpResult[index] {
        return false
      }
      index += 1
    }
    
    return true
  }
  
  // 改进的中序遍历
  private static func isValidBST2(_ root: TreeNode?) -> Bool {
    var preNode: TreeNode? = nil
    func midOrder(_ root: TreeNode?) -> Bool {
      guard let root = root else { return true }
      if !midOrder(root.left) {
        return false
      }
      if let preNode = preNode, preNode.val >= root.val {
        return false
      }
      preNode = root
      
      return midOrder(root.right)
    }
    
    return midOrder(root)
  }
  
  // 递归判断
  private static func isValidBST3(_ root: TreeNode?) -> Bool {
    func validBst(_ node: TreeNode?, min: Int?, max: Int?) -> Bool {
      guard let node = node else { return true }
      
      if let min = min, node.val <= min {
        return false
      }
      
      if let max = max, node.val >= max {
        return false
      }
      
      if let left = node.left,
         !validBst(left, min: min, max: node.val) {
        return false
      }
      
      if let right = node.right,
         !validBst(right, min: node.val, max: max) {
        return false
      }
      return true
    }
    
    return validBst(root, min: nil, max: nil)
  }
  
  // 错误记录
  private static func isValidBSTError(_ root: TreeNode?) -> Bool {
    guard root?.left != nil || root?.right != nil else {
      return true
    }
    
    guard let currentVal = root?.val else { return false }
    
    let leftChildVal = root?.left?.val
    let rightChildVal = root?.right?.val
    
    if leftChildVal != nil, rightChildVal != nil {
      if leftChildVal! < currentVal, rightChildVal! > currentVal {
        return isValidBSTError(root?.left) && isValidBSTError(root?.right)
      } else {
        return false
      }
    } else if leftChildVal != nil {
      if leftChildVal! < currentVal {
        return isValidBSTError(root?.left)
      } else {
        return false
      }
    } else {
      if rightChildVal! > currentVal {
        return isValidBSTError(root?.right)
      } else {
        return false
      }
    }
  }
}
