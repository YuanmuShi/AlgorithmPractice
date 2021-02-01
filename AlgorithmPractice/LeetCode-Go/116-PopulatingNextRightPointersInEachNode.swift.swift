//
//  116-PopulatingNextRightPointersInEachNode.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/23.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 116. 填充每个节点的下一个右侧节点指针
 给定一个 完美二叉树 ，其所有叶子节点都在同一层，每个父节点都有两个子节点。二叉树定义如下：

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。

 初始状态下，所有 next 指针都被设置为 NULL。

  

 进阶：

 你只能使用常量级额外空间。
 使用递归解题也符合要求，本题中递归程序占用的栈空间不算做额外的空间复杂度。
  

 示例：



 输入：root = [1,2,3,4,5,6,7]
 输出：[1,#,2,3,#,4,5,6,7,#]
 解释：给定二叉树如图 A 所示，你的函数应该填充它的每个 next 指针，以指向其下一个右侧节点，如图 B 所示。序列化的输出按层序遍历排列，同一层节点由 next 指针连接，'#' 标志着每一层的结束。
  

 提示：

 树中节点的数量少于 4096
 -1000 <= node.val <= 1000
 */

extension Solution {

  static func test116() {
    let root = Tree.create(tree: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15])
    print(root!.asString)
    let res = connect(root)
    print(res!.asString)
  }

  // 递归解法
  private static func connect(_ root: Node?) -> Node? {
    func _connect(_ root: Node?, _ parentNode: Node?) {
      guard root != nil else { return }
      root?.left?.next = root?.right
      
      if parentNode?.right === root {
        root?.next = parentNode?.next?.left
      }
      
      _connect(root?.left, root)
      _connect(root?.right, root)
    }
    
    _connect(root, nil)
    return root
  }
  
  // 层序遍历解法 与 117 一样
  private static func connect1(_ root: Node?) -> Node? {
    guard let root = root else { return nil }
    
    var currentLevelNods: [Node] = []
    var nextLevelNodes: [Node] = []
    
    var preNode: Node?
    
    currentLevelNods.append(root)
    
    while !currentLevelNods.isEmpty {
      let node = currentLevelNods.removeFirst()
      
      preNode?.next = node
      preNode = node
      
      if let left = node.left {
        nextLevelNodes.append(left)
      }
      
      if let right = node.right {
        nextLevelNodes.append(right)
      }
      
      if currentLevelNods.isEmpty {
        if !nextLevelNodes.isEmpty {
          preNode = nil
          currentLevelNods.append(contentsOf: nextLevelNodes)
          nextLevelNodes.removeAll()
        }
      }
    }
    
    return root
  }
}
