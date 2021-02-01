//
//  117-PopulatingNextRightPointersInEachNodeII.swift.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/1/23.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 117. 填充每个节点的下一个右侧节点指针 II
 给定一个二叉树

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。

 初始状态下，所有 next 指针都被设置为 NULL。

  

 进阶：

 你只能使用常量级额外空间。
 使用递归解题也符合要求，本题中递归程序占用的栈空间不算做额外的空间复杂度。
  

 示例：



 输入：root = [1,2,3,4,5,null,7]
 输出：[1,#,2,3,#,4,5,7,#]
 解释：给定二叉树如图 A 所示，你的函数应该填充它的每个 next 指针，以指向其下一个右侧节点，如图 B 所示。
  

 提示：

 树中的节点数小于 6000
 -100 <= node.val <= 100
 */

extension Solution {
  static func test117() {
    let root = Tree.create(tree: [1, 2, 3, nil, 5, nil, 6, nil, nil, nil, nil, nil, nil, nil, 8]
    )
    print(root!.asString)
    let res = connect(root)
    print(res!.asString)
  }

  /*
   层序遍历 空间复杂度为 O(1)
   思路与算法

     因为必须处理树上的所有节点，所以无法降低时间复杂度，但是可以尝试降低空间复杂度。

     在方法一中，因为对树的结构一无所知，所以使用队列保证有序访问同一层的所有节点，并建立它们之间的连接。然而不难发现：一旦在某层的节点之间建立了 \rm nextnext 指针，那这层节点实际上形成了一个链表。因此，如果先去建立某一层的 \rm nextnext 指针，再去遍历这一层，就无需再使用队列了。

     基于该想法，提出降低空间复杂度的思路：如果第 ii 层节点之间已经建立 \rm nextnext 指针，就可以通过 \rm nextnext 指针访问该层的所有节点，同时对于每个第 ii 层的节点，我们又可以通过它的 \rm leftleft 和 \rm rightright 指针知道其第 i+1i+1 层的孩子节点是什么，所以遍历过程中就能够按顺序为第 i + 1i+1 层节点建立 \rm nextnext 指针。

     具体来说：

     从根节点开始。因为第 00 层只有一个节点，不需要处理。可以在上一层为下一层建立 \rm nextnext 指针。该方法最重要的一点是：位于第 xx 层时为第 x + 1x+1 层建立 \rm nextnext 指针。一旦完成这些连接操作，移至第 x + 1x+1 层为第 x + 2x+2 层建立 \rm nextnext 指针。
     当遍历到某层节点时，该层节点的 \rm nextnext 指针已经建立。这样就不需要队列从而节省空间。每次只要知道下一层的最左边的节点，就可以从该节点开始，像遍历链表一样遍历该层的所有节点。
     */
  private static func connect(_ root: Node?) -> Node? {
    var currentLevelStartNode: Node? = root
    var nextLevelStartNode: Node?
    
    while currentLevelStartNode != nil {
      var currentLevelNode = currentLevelStartNode
      var current: Node?
      
      func _handleNode(_ node: Node?) {
        guard node != nil else { return }
        
        if nextLevelStartNode == nil {
          nextLevelStartNode = node
          current = nextLevelStartNode
        } else {
          current?.next = node
          current = current?.next
        }
      }
      
      while currentLevelNode != nil {
        _handleNode(currentLevelNode?.left)
        _handleNode(currentLevelNode?.right)
        currentLevelNode = currentLevelNode?.next
      }
      
      currentLevelStartNode = nextLevelStartNode
      nextLevelStartNode = nil
    }
    
    return root
  }
  
  // 层序遍历解法 与 116 一样
  private static func connect1(_ root: Node?) -> Node? {
    guard let root = root else { return nil }
    
    var currentLevelNods: [Node] = []
    var nextLevelNodes: [Node] = []
    
    var preNode: Node?
    
    currentLevelNods.append(root)
    
    while !currentLevelNods.isEmpty {
      let node = currentLevelNods.removeFirst()
      
      preNode?.next = node
      preNode = node
      
      if let left = node.left {
        nextLevelNodes.append(left)
      }
      
      if let right = node.right {
        nextLevelNodes.append(right)
      }
      
      if currentLevelNods.isEmpty {
        if !nextLevelNodes.isEmpty {
          preNode = nil
          currentLevelNods.append(contentsOf: nextLevelNodes)
          nextLevelNodes.removeAll()
        }
      }
    }
    
    return root
  }
}
