//
//  704-BinarySearch.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/2/3.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 704. 二分查找
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

 示例 1:

 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 示例 2:

 输入: nums = [-1,0,3,5,9,12], target = 2
 输出: -1
 解释: 2 不存在 nums 中因此返回 -1

 提示：

 你可以假设 nums 中的所有元素是不重复的。
 n 将在 [1, 10000]之间。
 nums 的每个元素都将在 [-9999, 9999]之间。
 */
extension Solution {
  static func test704() {
    print(search([-1, 0, 3, 5, 9, 12], -2))
  }

  private static func search(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty else { return -1 }

    var left = 0
    var right = nums.count - 1
    
    var result = -1

    while left <= right {
      let index = (left + right) / 2
      let mid = nums[index]

      if mid == target {
        result = index
        break
      } else if mid > target {
        right = index - 1
      } else {
        left = index + 1
      }
    }
    
    return result
  }
}
