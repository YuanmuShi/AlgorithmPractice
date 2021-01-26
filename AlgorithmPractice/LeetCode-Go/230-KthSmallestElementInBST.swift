//
//  230-KthSmallestElementInBST.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/26.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 给定一个二叉搜索树，编写一个函数 kthSmallest 来查找其中第 k 个最小的元素。

 说明：
 你可以假设 k 总是有效的，1 ≤ k ≤ 二叉搜索树元素个数。

 示例 1:

 输入: root = [3,1,4,null,2], k = 1
    3
   / \
  1   4
   \
    2
 输出: 1
 示例 2:

 输入: root = [5,3,6,2,4,null,null,1], k = 3
        5
       / \
      3   6
     / \
    2   4
   /
  1
 输出: 3
 进阶：
 如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 k 小的值，你将如何优化 kthSmallest 函数？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test230() {
//    let root = Tree.create(tree: [5, 3, 6, 2, 4, nil, nil, 1])
    let root = Tree.create(tree: [3, 1, 4, nil, 2])
    print(root!.asString)
    print("\(kthSmallest(root, 4))")
  }
  
  // 分治
  private static func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard let root  = root else { return 0 }
    func treeCount(_ root: TreeNode?) -> Int {
      guard let root  = root else { return 0 }
      return 1 + treeCount(root.left) + treeCount(root.right)
    }
    
    let leftNodeCount = treeCount(root.left)
    if leftNodeCount == k - 1 {
      return root.val
    } else if leftNodeCount >= k {
      return kthSmallest(root.left, k)
    } else {
      return kthSmallest(root.right, k - leftNodeCount - 1)
    }
  }

  private static func kthSmallest2(_ root: TreeNode?, _ k: Int) -> Int {
    var index = 0
    var value = 0

    func inorder(_ root: TreeNode?) {
      guard let root = root else { return }
      inorder(root.left)
      index += 1
      if index == k {
        value = root.val
        index += 1
        return
      } else if index > k {
        return
      }
      inorder(root.right)
    }
    inorder(root)
    return value
  }

  private static func kthSmallest1(_ root: TreeNode?, _ k: Int) -> Int {
    var inorderValues: [Int] = []

    func inorder(_ root: TreeNode?) {
      guard let root = root else { return }
      inorder(root.left)
      inorderValues.append(root.val)
      inorder(root.right)
    }
    inorder(root)
    return (k > 0 && k <= inorderValues.count) ? inorderValues[k - 1] : 0
  }
}
