//
//  103-BinaryTreeZigzagLevelOrderTraversal.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/28.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。

 例如：
 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回锯齿形层序遍历如下：

 [
   [3],
   [20,9],
   [15,7]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test103() {
    let root = Tree.create(tree: [1, 2, 3, 4, nil, nil, 5])
    print(root!.asString)
    print(zigzagLevelOrder(root))
  }

  private static func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var result: [[Int]] = []
    guard let root = root else { return result }

    var currentLevelNodes: [TreeNode] = []
    var nextLevelNodes: [TreeNode] = []
    var levelResult: [Int] = []
    currentLevelNodes.append(root)

    while !currentLevelNodes.isEmpty {
      let node = currentLevelNodes.removeFirst()
      if let left = node.left {
        nextLevelNodes.append(left)
      }
      if let right = node.right {
        nextLevelNodes.append(right)
      }
      levelResult.append(node.val)

      if currentLevelNodes.isEmpty {
        if !nextLevelNodes.isEmpty {
          currentLevelNodes.append(contentsOf: nextLevelNodes)
          nextLevelNodes.removeAll()
        }
        if result.count % 2 == 0 {
          result.append(levelResult)
        } else {
          result.append(levelResult.reversed())
        }
        levelResult.removeAll()
      }
    }

    return result
  }
}
