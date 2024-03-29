//
//  705-DesignHashset.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/13.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 705. 设计哈希集合
 不使用任何内建的哈希表库设计一个哈希集合（HashSet）。

 实现 MyHashSet 类：

 void add(key) 向哈希集合中插入值 key 。
 bool contains(key) 返回哈希集合中是否存在这个值 key 。
 void remove(key) 将给定值 key 从哈希集合中删除。如果哈希集合中没有这个值，什么也不做。

 示例：

 输入：
 ["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
 [[], [1], [2], [1], [3], [2], [2], [2], [2]]
 输出：
 [null, null, null, true, false, null, true, null, false]

 解释：
 MyHashSet myHashSet = new MyHashSet();
 myHashSet.add(1);      // set = [1]
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(1); // 返回 True
 myHashSet.contains(3); // 返回 False ，（未找到）
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(2); // 返回 True
 myHashSet.remove(2);   // set = [1]
 myHashSet.contains(2); // 返回 False ，（已移除）

 提示：

 0 <= key <= 106
 最多调用 104 次 add、remove 和 contains 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/design-hashset
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test705() {
    let hashSet = MyHashSetWithSystem()

    hashSet.add(1)
    hashSet.add(2)
    hashSet.remove(3)
    print(hashSet.contains(2))
  }
}

class MyHashSet {
  // 可以使用数组或者哈希链表法
}

// 使用系统方法实现
class MyHashSetWithSystem {
  var hashSet: Set<Int> = []

  init() {}

  func add(_ key: Int) {
    hashSet.insert(key)
  }

  func remove(_ key: Int) {
    hashSet.remove(key)
  }

  func contains(_ key: Int) -> Bool {
    return hashSet.contains(key)
  }
}
