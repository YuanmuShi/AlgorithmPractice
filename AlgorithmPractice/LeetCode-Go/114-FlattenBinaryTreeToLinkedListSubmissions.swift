//
//  114-FlattenBinaryTreeToLinkedListSubmissions.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/22.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test114() {
    let root = Tree.create(tree: [1, 5])
    flatten(root)
    print(root!.asString)
  }
  
  // 先序遍历且记录前一节点
  private static func flatten(_ root: TreeNode?) {
    var preNode: TreeNode?
    
    func flat(_ root: TreeNode?) {
      guard let root = root else { return }
      
      let right = root.right
      let left = root.left
      root.left = nil
      preNode?.right = root
      preNode = root
      flat(left)
      flat(right)
    }
    
    flat(root)
  }
}
