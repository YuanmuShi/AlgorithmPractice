//
//  450-DeleteNodeInBST.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/27.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 给定一个二叉搜索树的根节点 root 和一个值 key，删除二叉搜索树中的 key 对应的节点，并保证二叉搜索树的性质不变。返回二叉搜索树（有可能被更新）的根节点的引用。

 一般来说，删除节点可分为两个步骤：

 首先找到需要删除的节点；
 如果找到了，删除它。
 说明： 要求算法时间复杂度为 O(h)，h 为树的高度。

 示例:

 root = [5,3,6,2,4,null,7]
 key = 3

     5
    / \
   3   6
  / \   \
 2   4   7

 给定需要删除的节点值是 3，所以我们首先找到 3 这个节点，然后删除它。

 一个正确的答案是 [5,4,6,2,null,null,7], 如下图所示。

     5
    / \
   4   6
  /     \
 2       7

 另一个正确答案是 [5,2,6,null,4,null,7]。

     5
    / \
   2   6
    \   \
     4   7

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/delete-node-in-a-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test450() {
    let root = Tree.create(tree: [5, 3, 6, 2, 4, nil, 7])
//    let root = Tree.create(tree: [4, 1, 6, 0, 2, 5, 7, nil, nil, nil, 3, nil, nil, nil, 8])
//    let root = Tree.create(tree: [5, 2, 6, 1, 4, nil, 7, nil, nil, 3])
//    print(root!.asString)

    _ = deleteNode(root, 3)
    print(root!.asString)
  }

  // 若被删除节点的左右子树都不为空，则返回右子树的根节点，将左子树作为右子树的最小节点的左子树
  private static func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else { return nil }
    if root.val == key {
      if root.left == nil, root.right == nil {
        return nil
      } else if root.left != nil, root.right != nil {
        func moveSubTree(_ subRoot: TreeNode) {
          if let left = subRoot.left {
            moveSubTree(left)
          } else {
            subRoot.left = root.left
          }
        }
        moveSubTree(root.right!)
        return root.right
      } else if root.left != nil {
        return root.left
      } else {
        return root.right
      }
    } else if root.val < key {
      root.right = deleteNode(root.right, key)
    } else {
      root.left = deleteNode(root.left, key)
    }
    return root
  }
}
