//
//  106-ConstructBinaryTreeFromInorderAndPostorderTraversal.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/24.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 根据一棵树的中序遍历与后序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 中序遍历 inorder = [9,3,15,20,7]
 后序遍历 postorder = [9,15,7,20,3]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test106() {
//    let root = buildTree([9,3,15,20,7], [9,15,7,20,3])
//    let root = buildTree([3, 2, 1], [3, 2, 1])
    let root = buildTree([1, 2, 3], [3, 2, 1])
    print(root!.asString)
    
  }

  private static func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    guard !inorder.isEmpty, inorder.count == postorder.count else  { return nil }
    
    let rootVal = postorder.last!
    let root = TreeNode(rootVal)
    
    let leftInorder = Array(inorder.prefix(inorder.firstIndex(of: rootVal)!))
    let leftPostorder = Array(postorder.prefix(leftInorder.count))
    
    let rightInorder = Array(inorder.suffix(inorder.count - leftInorder.count - 1))
    let rightPostorder = Array(postorder[leftPostorder.count..<(leftPostorder.count + rightInorder.count)])
    
    root.left = buildTree(leftInorder, leftPostorder)
    root.right = buildTree(rightInorder, rightPostorder)
    
    return root
  }
}
