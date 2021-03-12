//
//  331-VerifyPreorderSerializationOfABinaryTree.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/12.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 331. 验证二叉树的前序序列化
 序列化二叉树的一种方法是使用前序遍历。当我们遇到一个非空节点时，我们可以记录下这个节点的值。如果它是一个空节点，我们可以使用一个标记值记录，例如 #。

      _9_
     /   \
    3     2
   / \   / \
  4   1  #  6
 / \ / \   / \
 # # # #   # #
 例如，上面的二叉树可以被序列化为字符串 "9,3,4,#,#,1,#,#,2,#,6,#,#"，其中 # 代表一个空节点。

 给定一串以逗号分隔的序列，验证它是否是正确的二叉树的前序序列化。编写一个在不重构树的条件下的可行算法。

 每个以逗号分隔的字符或为一个整数或为一个表示 null 指针的 '#' 。

 你可以认为输入格式总是有效的，例如它永远不会包含两个连续的逗号，比如 "1,,3" 。

 示例 1:

 输入: "9,3,4,#,#,1,#,#,2,#,6,#,#"
 输出: true
 示例 2:

 输入: "1,#"
 输出: false
 示例 3:

 输入: "9,#,#,1"
 输出: false

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/verify-preorder-serialization-of-a-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
extension Solution {
  static func test331() {
    print(isValidSerialization("9,3,4,#,#,1,#,#,2,#,6,#,#"))
    print(isValidSerialization("9,#"))
  }

  /*
   由于题目中将所有空节点都使用 # 代替，因此可以使用树的出入度解决
   每个非空节点会产生 2 个出度，并且消耗 1 个入度（根节点只产生出度，不消耗入度）
   则整棵树的入度为：节点数 - 1
   则整棵树的出度为：非空节点数 * 2
   若 出度 == 入度，则合法
   */
  private static func isValidSerialization(_ preorder: String) -> Bool {
    let nodeVals = preorder.split(separator: ",").map { Int($0) }
    let inCount = nodeVals.count - 1
    let outCount = nodeVals.compactMap { $0 }.count * 2
    return inCount == outCount
  }

  // 使用 297 方法，将 preorder 先反序列化后再次序列化，判断新序列化的值与传入的值是否相等
  private static func isValidSerialization1(_ preorder: String) -> Bool {
    let preorderStr = preorder.replacingOccurrences(of: " ", with: "")
    let codec = Codec()
    let newPreorderStr = codec.serialize(codec.deserialize(preorder))
    return newPreorderStr == preorderStr
  }
}
