//
//  236-LowestCommonAncestorOfaBinaryTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/18.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test236() {
    let root = Tree.createByRecursion(array: [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4])
    print(root!.asString)
    
    let node = Self.lowestCommonAncestor(root, TreeNode(2), TreeNode(0))
    print(node!.val)
  }
  
  private static func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil {
      return nil
    }
    
    if root?.val == p?.val || root?.val == q?.val {
      return root
    }
    
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    
    if left == nil {
      return right
    }
    
    if right == nil {
      return left
    }
    
    return root
  }
}
