//
//  703-KthLargest.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/12.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 703. 数据流中的第 K 大元素
 设计一个找到数据流中第 k 大元素的类（class）。注意是排序后的第 k 大元素，不是第 k 个不同的元素。

 请实现 KthLargest 类：

 KthLargest(int k, int[] nums) 使用整数 k 和整数流 nums 初始化对象。
 int add(int val) 将 val 插入数据流 nums 后，返回当前数据流中第 k 大的元素。
  

 示例：

 输入：
 ["KthLargest", "add", "add", "add", "add", "add"]
 [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
 输出：
 [null, 4, 5, 5, 8, 8]

 解释：
 KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
 kthLargest.add(3);   // return 4
 kthLargest.add(5);   // return 5
 kthLargest.add(10);  // return 5
 kthLargest.add(9);   // return 8
 kthLargest.add(4);   // return 8
  

 提示：
 1 <= k <= 104
 0 <= nums.length <= 104
 -104 <= nums[i] <= 104
 -104 <= val <= 104
 最多调用 add 方法 104 次
 题目数据保证，在查找第 k 大元素时，数组中至少有 k 个元素
 */

extension Solution {
  static func test703() {
//    let kthLargest = KthLargest(3, [4, 5, 8, 2])
//    print(kthLargest.add(3))
//    print(kthLargest.add(5))
//    print(kthLargest.add(10))
//    print(kthLargest.add(9))
//    print(kthLargest.add(4))
    
//    let kthLargest = KthLargest(7, [-10,1,3,1,4,10,3,9,4,5,1])
//    print(kthLargest.add(3))
//    print(kthLargest.add(2))
//    print(kthLargest.add(3))
//    print(kthLargest.add(1))
//    print(kthLargest.add(2))
//    print(kthLargest.add(4))
    
//    [[3],[2],[3],[1],[2],[4],[5],[5],[6],[7],[7],[8],[2],[3],[1],[1],[1],[10],[11],[5],[6],[2],[4],[7],[8],[5],[6]].forEach { [weak kthLargest] e in
//      print(kthLargest?.add(e[0]))
//    }
    
  }
}

class KthLargest {
  private var priorityQueue: MyPriorityQueue<Int>
  
  init(_ k: Int, _ nums: [Int]) {
    priorityQueue = MyPriorityQueue(collection: nums, capacity: UInt(k))
  }
  
  @discardableResult
  func add(_ val: Int) -> Int {
    priorityQueue.offer(val)
    return priorityQueue.peek() ?? 0
  }
}

class KthLargest1 {
  
  private var nums: [Int] = []
  
  private let k: Int
  private var kthLargestNums: [Int] = []

  init(_ k: Int, _ nums: [Int]) {
    self.k = k
    
    nums.forEach { [weak self] num in
      self?.add(num)
    }
  }
  
  @discardableResult
  func add(_ val: Int) -> Int {
    func sortKthNums() {
      guard kthLargestNums.count > 1 else { return }
      let maxIndex = kthLargestNums.count - 1
      for i in 0..<maxIndex {
        let num = kthLargestNums[maxIndex - i]
        let pre = kthLargestNums[maxIndex - i - 1]
        
        if pre >= num { break }
        kthLargestNums[maxIndex - i - 1] = num
        kthLargestNums[maxIndex - i] = pre
      }
    }
    
    if kthLargestNums.count < k {
      kthLargestNums.append(val)
      sortKthNums()
      return kthLargestNums.last ?? 0
    }
    
    guard let lastNum = kthLargestNums.last else { return 0 }
    
    if lastNum > val {
      return lastNum
    }
    kthLargestNums.removeLast()
    kthLargestNums.append(val)
    sortKthNums()
    return kthLargestNums.last ?? 0
  }
  
  // 超时
  func add2(_ val: Int) -> Int {
    nums.append(val)
    nums = nums.sorted(by: { $0 > $1 })
    return nums[k - 1]
  }
  
  // 超时
  func add3(_ val: Int) -> Int {
    nums.append(val)
    let totalCount = nums.count

    for i in 1 ..< totalCount {
      let tmp = nums[totalCount - i - 1]
      if val > tmp {
        nums[totalCount - i] = tmp
        nums[totalCount - i - 1] = val
      } else {
        return nums[k - 1]
      }
    }

    return nums[k - 1]
  }
}
