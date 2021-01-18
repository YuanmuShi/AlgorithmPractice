//
//  235-LowestCommonAncestorOfaBinarySearchTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/18.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  
  static func test235() {
    let root = Tree.createByRecursion(array: [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5])
    print(root!.asString)
    
    let node = Self.lowestCommonAncestor(root, TreeNode(3), TreeNode(5))
    print(node!.val)
  }
  
  private static func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root, let p = p, let q = q else {
      return nil
    }
    
    if (p.val >= root.val && q.val <= root.val) || (p.val <= root.val && q.val >= root.val) {
      return root
    }
    
    if p.val < root.val {
      return lowestCommonAncestor(root.left, p, q)
    } else {
      return lowestCommonAncestor(root.right, p, q)
    }
  }
}
