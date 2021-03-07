//
//  503-NextGreaterElementII.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/6.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 503. 下一个更大元素 II
 给定一个循环数组（最后一个元素的下一个元素是数组的第一个元素），输出每个元素的下一个更大元素。数字 x 的下一个更大的元素是按数组遍历顺序，这个数字之后的第一个比它更大的数，这意味着你应该循环地搜索它的下一个更大的数。如果不存在，则输出 -1。

 示例 1:

 输入: [1,2,1]
 输出: [2,-1,2]
 解释: 第一个 1 的下一个更大的数是 2；
 数字 2 找不到下一个更大的数；
 第二个 1 的下一个最大的数需要循环搜索，结果也是 2。
 注意: 输入数组的长度不会超过 10000。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/next-greater-element-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test503() {
    print(nextGreaterElements([5, 4, 3, 2, 1]))
    print(nextGreaterElements([1, 2, 3, 2, 1]))
    print(nextGreaterElements([1, 2, 1]))
  }

  // 单调栈
  private static func nextGreaterElements(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else {
      return []
    }
    
    let count = nums.count
    var result: [Int] = Array(repeating: -1, count: nums.count)
    var stack: [Int] = []

    for index in 0 ..< count * 2 {
      let num = nums[index % count]
      // 维持一个单调递减栈，注意这里保存的是索引
      while let last = stack.last, nums[last] < num {
        result[last] = num
        stack.removeLast()
      }
      // 只保存真实数组索引，忽略人为扩展的重复索引
      if index < count {
        stack.append(index % nums.count)
      }
    }
    return result
  }

  // 暴力法求解
  private static func nextGreaterElements1(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else {
      return []
    }

    var result: [Int] = Array(repeating: -1, count: nums.count)
    var tmpNums = nums
    tmpNums.append(contentsOf: nums)

    for i in 0 ..< nums.count {
      let num = nums[i]
      for j in (i + 1) ..< tmpNums.count {
        let tmp = tmpNums[j]
        if tmp > num {
          result[i] = tmp
          break
        }
      }
    }

    return result
  }

  // 错误的尝试
  private static func nextGreaterElements2(_ nums: [Int]) -> [Int] {
    guard !nums.isEmpty else {
      return []
    }

    var stack: [Int] = []

    for i in 0 ..< nums.count {
      if stack.isEmpty {
        stack.append(i)
        continue
      }

      let num = nums[i]
      if num >= nums[stack.last!] {
        stack.append(i)
        continue
      }

      var tmp: [Int] = []
      while !stack.isEmpty, nums[stack.last!] > num {
        tmp.append(stack.removeLast())
      }

      stack.append(i)
      while !tmp.isEmpty {
        stack.append(tmp.removeLast())
      }
    }

    var result: [Int] = Array(repeating: -1, count: nums.count)
    var maxNum = nums[stack.last!]
    var preNum = maxNum

    while !stack.isEmpty {
      let index = stack.removeLast()
      let num = nums[index]

      if num >= maxNum {
        preNum = num
        continue
      }

      if preNum > num {
        maxNum = preNum
      }
      result[index] = maxNum
      preNum = num
    }

    return result
  }
}
