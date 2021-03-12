//
//  297-SerializeAndDeserializeBinaryTree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/25.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 297. 二叉树的序列化与反序列化
 序列化是将一个数据结构或者对象转换为连续的比特位的操作，进而可以将转换后的数据存储在一个文件或者内存中，同时也可以通过网络传输到另一个计算机环境，采取相反方式重构得到原数据。

 请设计一个算法来实现二叉树的序列化与反序列化。这里不限定你的序列 / 反序列化算法执行逻辑，你只需要保证一个二叉树可以被序列化为一个字符串并且将这个字符串反序列化为原始的树结构。

 提示: 输入输出格式与 LeetCode 目前使用的方式一致，详情请参阅 LeetCode 序列化二叉树的格式。你并非必须采取这种方式，你也可以采用其他的方法解决这个问题。

 示例 1：

 输入：root = [1,2,3,null,null,4,5]
 输出：[1,2,3,null,null,4,5]
 示例 2：

 输入：root = []
 输出：[]
 示例 3：

 输入：root = [1]
 输出：[1]
 示例 4：

 输入：root = [1,2]
 输出：[1,2]

 提示：

 树中结点数在范围 [0, 104] 内
 -1000 <= Node.val <= 1000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test297() {
    let root = Tree.create(tree: [1, 2, 3, nil, nil, 4, 5])

    let ser = Codec()

    let serialize = ser.serialize(root)
    print(serialize)

    let node = ser.deserialize(serialize)
    print(node!.asString)
  }
}

class Codec {
  func serialize(_ root: TreeNode?) -> String {
    guard let root = root else { return "#" }
    return "\(root.val),\(serialize(root.left)),\(serialize(root.right))"
  }

  func deserialize(_ data: String) -> TreeNode? {
    guard !data.isEmpty else { return nil }
    var nodeVals = data.split(separator: ",").map { Int($0) }

    func _deserialize() -> TreeNode? {
      guard !nodeVals.isEmpty,
            let first = nodeVals.removeFirst() else {
        return nil
      }

      let root = TreeNode(first)
      root.left = _deserialize()
      root.right = _deserialize()
      return root
    }

    return _deserialize()
  }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
