//
//  114-FlattenBinaryTreeToLinkedListSubmissions.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/22.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 114. 二叉树展开为链表
 给你二叉树的根结点 root ，请你将它展开为一个单链表：

 展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
 展开后的单链表应该与二叉树 先序遍历 顺序相同。
  

 示例 1：


 输入：root = [1,2,5,3,4,null,6]
 输出：[1,null,2,null,3,null,4,null,5,null,6]
 示例 2：

 输入：root = []
 输出：[]
 示例 3：

 输入：root = [0]
 输出：[0]
  

 提示：

 树中结点数在范围 [0, 2000] 内
 -100 <= Node.val <= 100
 */

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
