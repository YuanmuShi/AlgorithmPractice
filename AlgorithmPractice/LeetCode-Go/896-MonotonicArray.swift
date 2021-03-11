//
//  896-MonotonicArray.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/3/11.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 896. 单调数列
 如果数组是单调递增或单调递减的，那么它是单调的。

 如果对于所有 i <= j，A[i] <= A[j]，那么数组 A 是单调递增的。 如果对于所有 i <= j，A[i]> = A[j]，那么数组 A 是单调递减的。

 当给定的数组 A 是单调数组时返回 true，否则返回 false。

 示例 1：

 输入：[1,2,2,3]
 输出：true
 示例 2：

 输入：[6,5,4,4]
 输出：true
 示例 3：

 输入：[1,3,2]
 输出：false
 示例 4：

 输入：[1,2,4,5]
 输出：true
 示例 5：

 输入：[1,1,1]
 输出：true

 提示：

 1 <= A.length <= 50000
 -100000 <= A[i] <= 100000

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/monotonic-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test896() {
    print(isMonotonic([1, 2, 2, 3]))
    print(isMonotonic([6, 5, 4, 4]))
    print(isMonotonic([1, 3, 2]))
    print(isMonotonic([1, 2, 4, 5]))
    print(isMonotonic([1, 1, 1]))
  }

  // 一次遍历
  private static func isMonotonic(_ A: [Int]) -> Bool {
    guard A.count > 1 else { return true }

    var isUp = true
    var isDown = true

    for i in 1 ..< A.count {
      let current = A[i]
      let pre = A[i - 1]

      isUp = isUp && (pre <= current)
      isDown = isDown && (pre >= current)
    }

    return isUp || isDown
  }

  // 两次遍历
  private static func isMonotonic1(_ A: [Int]) -> Bool {
    guard A.count > 1 else { return true }

    var isUp = true
    // 判断是否是递增
    for i in 1 ..< A.count {
      let current = A[i]
      let pre = A[i - 1]

      if pre > current {
        isUp = false
        break
      }
    }
    // 如果已经判断是递增，直接返回
    if isUp {
      return true
    }

    var isDown = true
    // 判断是否是递减
    for i in 1 ..< A.count {
      let current = A[i]
      let pre = A[i - 1]

      if pre < current {
        isDown = false
        break
      }
    }
    return isDown
  }
}
