//
//  652-FindDuplicateSubtrees.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/28.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 652. 寻找重复的子树
 给定一棵二叉树，返回所有重复的子树。对于同一类的重复子树，你只需要返回其中任意一棵的根结点即可。

 两棵树重复是指它们具有相同的结构以及相同的结点值。

 示例 1：

         1
        / \
       2   3
      /   / \
     4   2   4
        /
       4
 下面是两个重复的子树：

       2
      /
     4
 和

     4
 因此，你需要以列表的形式返回上述重复子树的根结点。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-duplicate-subtrees
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test652() {
    let root = Tree.create(tree: [1, 2, 3, 4, nil, 2, 4, nil, nil, nil, nil, 4])
    print(root!.asString)
    let res = findDuplicateSubtrees(root)
    print(res)
  }

  private static func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
    guard let root = root else { return [] }

    var serialiedTrees: [String] = []

    func serialize(_ root: TreeNode?) -> String {
      guard let root = root else { return "#" }
      if root.left == nil, root.right == nil {
        return "\(root.val)"
      }
      return "\(root.val),\(serialize(root.left)),\(serialize(root.right))"
    }

    var nodes: [TreeNode] = []
    nodes.append(root)

    var results: [String: TreeNode] = [:]

    while !nodes.isEmpty {
      let node = nodes.removeFirst()
      let treeSerialize = serialize(node)

      if serialiedTrees.contains(treeSerialize) {
        results[treeSerialize] = node
      } else {
        serialiedTrees.append(treeSerialize)
      }

      if let left = node.left {
        nodes.append(left)
      }
      if let right = node.right {
        nodes.append(right)
      }
    }

    return results.map { $1 }
  }
}
