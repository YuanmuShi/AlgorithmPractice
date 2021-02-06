//
//  152-MaximumProductSubarray.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/2/5.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 152. 乘积最大子数组
 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。

 示例 1:

 输入: [2,3,-2,4]
 输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 示例 2:

 输入: [-2,0,-1]
 输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-product-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test152() {
    print(maxProduct([2, 3, -2, 0, 4]))
    print(maxProduct([0, 2]))
  }

  private static func maxProduct(_ nums: [Int]) -> Int {
//    var allRes: [[Int]] = []
//    func recursion(_ index: Int, currentPath: [Int]) {
//      guard index < nums.count else { return }
//      var tmp = currentPath
//      tmp.append(nums[index])
//      if tmp.count > 1 {
//        allRes.append(tmp)
//      }
//
//      recursion(index + 1, currentPath: tmp)
//      recursion(index + 1, currentPath: [])
//    }
//    recursion(0, currentPath: [])

    func dp(_ nums: [Int]) -> Int {
      guard nums.count > 1 else { return nums.first ?? 0 }

      var positiveNums: [Int] = []
      var negativeNums: [Int] = []

      if nums[0] >= 0 {
        positiveNums.append(nums[0])
        negativeNums.append(0)
      } else {
        positiveNums.append(0)
        negativeNums.append(nums[0])
      }

      for index in 1 ..< nums.count {
        let num = nums[index]
        if num >= 0 {
          positiveNums.append(max(positiveNums[index - 1] * num, num))
          negativeNums.append(min(negativeNums[index - 1] * num, num))
        } else {
          positiveNums.append(max(negativeNums[index - 1] * num, num))
          negativeNums.append(min(positiveNums[index - 1] * num, num))
        }
      }

      return positiveNums.max() ?? 0
    }

    return dp(nums)
  }
}
