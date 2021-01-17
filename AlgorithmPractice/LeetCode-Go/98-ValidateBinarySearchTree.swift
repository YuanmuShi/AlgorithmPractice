//
//  98-ValidateBinarySearchTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/17.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test98() {
    let tree = Tree.create(tree: [1, 1])
    print(tree!.asString)
    print("\(isValidBST1(tree))")
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
