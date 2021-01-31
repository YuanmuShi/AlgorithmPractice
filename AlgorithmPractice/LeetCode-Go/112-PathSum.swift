//
//  112-PathSum.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/30.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 112. 路径总和
 给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。

 叶子节点 是指没有子节点的节点。

 示例 1：

 输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 输出：true
 示例 2：

 输入：root = [1,2,3], targetSum = 5
 输出：false
 示例 3：

 输入：root = [1,2], targetSum = 0
 输出：false

 提示：

 树中节点的数目在范围 [0, 5000] 内
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
 */


// 本题与 257 题类似，257 题找到所有路径，本题只需找到一条路径即可
extension Solution {
  
  static func test112() {
//    let root = Tree.create(tree: [5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, nil, nil, 1])
    let root = Tree.create(tree: [1, 2, 3])
    print(root!.asString)

    print(hasPathSum(root, 5))
  }

  private static func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else { return false }
    var hasFound = false

    func dfs(_ root: TreeNode?, _ pathNodes: [TreeNode]) {
      guard let root = root else { return }

      var newPathNodes = pathNodes
      newPathNodes.append(root)
      if root.left == nil, root.right == nil {
        if newPathNodes.reduce(0, { (result, node) -> Int in
          result + node.val
        }) == targetSum {
          hasFound = true
          return
        }
      }

      dfs(root.left, newPathNodes)
      dfs(root.right, newPathNodes)
    }

    dfs(root, [])

    return hasFound
  }
}
