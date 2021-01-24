//
//  105-ConstructBinaryTreeFromPreorderAndInorderTraversal.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/24.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test105() {
    let root = buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7])
//    let root = buildTree([1, 2, 3], [3, 2, 1])
    print(root!.asString)
  }

  private static func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard !preorder.isEmpty, !inorder.isEmpty else { return nil }

    let rootVal = preorder[0]
    let root = TreeNode(rootVal)
    
    let leftInorder = Array(inorder.prefix(inorder.firstIndex(of: rootVal)!))
    let leftPreorder = Array(preorder.prefix(leftInorder.count + 1).dropFirst())

    let rightPreorder = Array(preorder.suffix(preorder.count - leftPreorder.count - 1))
    let rightInorder = Array(inorder.suffix(preorder.count - leftPreorder.count - 1))

    root.left = buildTree(leftPreorder, leftInorder)
    root.right = buildTree(rightPreorder, rightInorder)

    return root
  }
}
