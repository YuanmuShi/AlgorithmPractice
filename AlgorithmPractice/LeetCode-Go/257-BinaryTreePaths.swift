//
//  257-BinaryTreePaths.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/30.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 257. 二叉树的所有路径

 给定一个二叉树，返回所有从根节点到叶子节点的路径。

 说明: 叶子节点是指没有子节点的节点。

 示例:

 输入:

    1
  /   \
 2     3
  \
   5

 输出: ["1->2->5", "1->3"]

 解释: 所有根节点到叶子节点的路径为: 1->2->5, 1->3

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-paths
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test257() {
    let root = Tree.create(tree: [1, 2, 3, nil, 5])
//    let root = Tree.create(tree: [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, nil, nil, 1])
    print(root!.asString)
    print(binaryTreePaths(root))
  }

  // BFS
  private static func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var result: [String] = []
    guard let root = root else { return result }

    var nodeQueue: [TreeNode] = []
    var pathQueue: [String] = []

    nodeQueue.append(root)
    pathQueue.append("\(root.val)")
    
    while !nodeQueue.isEmpty {
      let node = nodeQueue.removeFirst()
      let path = pathQueue.removeFirst()
      
      if node.left == nil, node.right == nil {
        result.append(path)
      }
      
      if let left = node.left {
        nodeQueue.append(left)
        pathQueue.append("\(path)->\(left.val)")
      }
      
      if let right = node.right {
        nodeQueue.append(right)
        pathQueue.append("\(path)->\(right.val)")
      }
    }

    return result
  }

  // DFS
  private static func binaryTreePathsDFS(_ root: TreeNode?) -> [String] {
    var result: [String] = []

    func dfs(_ root: TreeNode?, _ path: String) {
      guard let root = root else { return }

      let newPath = path.isEmpty ? "\(root.val)" : "\(path)->\(root.val)"
      if root.left == nil, root.right == nil {
        result.append(newPath)
      }

      dfs(root.left, newPath)
      dfs(root.right, newPath)
    }

    dfs(root, "")
    return result
  }
}
