//
//  303-RangeSumQueryImmutable.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/1.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 303. 区域和检索 - 数组不可变
 给定一个整数数组  nums，求出数组从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点。

 实现 NumArray 类：

 NumArray(int[] nums) 使用数组 nums 初始化对象
 int sumRange(int i, int j) 返回数组 nums 从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点（也就是 sum(nums[i], nums[i + 1], ... , nums[j])）

 示例：

 输入：
 ["NumArray", "sumRange", "sumRange", "sumRange"]
 [[[-2, 0, 3, -5, 2, -1]], [0, 2], [2, 5], [0, 5]]
 输出：
 [null, 1, -1, -3]

 解释：
 NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
 numArray.sumRange(0, 2); // return 1 ((-2) + 0 + 3)
 numArray.sumRange(2, 5); // return -1 (3 + (-5) + 2 + (-1))
 numArray.sumRange(0, 5); // return -3 ((-2) + 0 + 3 + (-5) + 2 + (-1))

 提示：

 0 <= nums.length <= 104
 -105 <= nums[i] <= 105
 0 <= i <= j < nums.length
 最多调用 104 次 sumRange 方法

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/range-sum-query-immutable
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test303() {
//    let nums = NumArray([])
    let nums = NumArray([-2, 0, 3, -5, 2, -1])
    print(nums.sumRange(0, 5))
  }
}

// preSum 方法
class NumArray {
  private let nums: [Int]
  private let preSum: [Int]

  init(_ nums: [Int]) {
    self.nums = nums
    guard !nums.isEmpty else {
      preSum = []
      return
    }

    var tmp: [Int] = Array(repeating: 0, count: nums.count + 1)
    for i in 1 ... nums.count {
      tmp[i] = tmp[i - 1] + nums[i - 1]
    }
    preSum = tmp
  }

  func sumRange(_ i: Int, _ j: Int) -> Int {
    guard i >= 0, j < nums.count, i <= j else {
      return 0
    }
    return preSum[j + 1] - preSum[i]
  }
}

// 优化： 用一个二维数组存储, result[i][j] 标识 range 为 i ~ j 的和
// LeetCode 结果： 初始化超时
/*
 class NumArray {
   private let nums: [Int]
   private var result: [[Int]]

   init(_ nums: [Int]) {
     self.nums = nums
     result = Array(repeating: Array(repeating: 0, count: nums.count), count: nums.count)
     guard !nums.isEmpty else { return }

     result[0][0] = nums[0]

     for i in 0..<nums.count {
       for j in 1..<nums.count {
         if j >= i {
           result[i][j] = result[i][j-1] + nums[j]
         }
       }
     }
   }

   func sumRange(_ i: Int, _ j: Int) -> Int {
     guard i >= 0, j < nums.count, i <= j else {
       return 0
     }
     return result[i][j]
   }
 }
  */

/*
 // 暴力求解
 class NumArray {
   private let nums: [Int]

   init(_ nums: [Int]) {
     self.nums = nums
   }

   func sumRange(_ i: Int, _ j: Int) -> Int {
     guard i >= 0, j < nums.count, i <= j else {
       return 0
     }

     var result = 0

     for index in i...j {
       result += nums[index]
     }

     return result
   }
  }
 */
