//
//  456-132Pattern.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/24.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 456. 132模式
 给定一个整数序列：a1, a2, ..., an，一个132模式的子序列 ai, aj, ak 被定义为：当 i < j < k 时，ai < ak < aj。设计一个算法，当给定有 n 个数字的序列时，验证这个序列中是否含有132模式的子序列。

 注意：n 的值小于15000。

 示例1:

 输入: [1, 2, 3, 4]

 输出: False

 解释: 序列中不存在132模式的子序列。
 示例 2:

 输入: [3, 1, 4, 2]

 输出: True

 解释: 序列中有 1 个132模式的子序列： [1, 4, 2].
 示例 3:

 输入: [-1, 3, 2, 0]

 输出: True

 解释: 序列中有 3 个132模式的的子序列: [-1, 3, 2], [-1, 3, 0] 和 [-1, 2, 0].

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/132-pattern
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test456() {
    print(find132pattern([1, 2, 3, 4]))
    print(find132pattern([3, 1, 4, 2]))
    print(find132pattern([1, 0, 1, -4, -3]))
  }

  private static func find132pattern(_ nums: [Int]) -> Bool {
    let count = nums.count
    guard count > 2 else { return false }

    var mins: [Int] = [nums[0]]
    for i in 1..<count {
      mins.append(min(nums[i], mins[i - 1]))
    }

    var stack: [Int] = []

    for j in (1..<count).reversed() {
      guard nums[j] > mins[j] else { continue }
      while !stack.isEmpty, let last = stack.last, last <= mins[j] {
        stack.removeLast()
      }
      if !stack.isEmpty, let last = stack.last, last < nums[j] {
        return true
      }
      stack.append(nums[j])
    }

    return false
  }

  // 超时算法
  private static func find132pattern1(_ nums: [Int]) -> Bool {
    let count = nums.count
    guard count > 2 else { return false }

    var leftMin = nums[0]
    var rightNums = nums[2..<count].sorted()

    for i in 1..<count {
      if leftMin < nums[i] {
        if let rightMin = rightNums.first(where: { $0 > leftMin }),
           rightMin < nums[i] {
          return true
        }
      }
      leftMin = min(leftMin, nums[i])
      if i + 1 < count,
         let index = rightNums.firstIndex(of: nums[i + 1]) {
        rightNums.remove(at: index)
      }
    }

    return false
  }
}
