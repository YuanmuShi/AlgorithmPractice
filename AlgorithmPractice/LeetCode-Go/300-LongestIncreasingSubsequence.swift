//
//  300-LongestIncreasingSubsequence.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/4.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 300. 最长递增子序列

 给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

 子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

 示例 1：

 输入：nums = [10,9,2,5,3,7,101,18]
 输出：4
 解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
 示例 2：

 输入：nums = [0,1,0,3,2,3]
 输出：4
 示例 3：

 输入：nums = [7,7,7,7,7,7,7]
 输出：1

 提示：

 1 <= nums.length <= 2500
 -104 <= nums[i] <= 104

 进阶：

 你可以设计时间复杂度为 O(n2) 的解决方案吗？
 你能将算法的时间复杂度降低到 O(n log(n)) 吗?

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-increasing-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test300() {
    print(lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]))
    print(lengthOfLIS([]))
    print(lengthOfLIS([2,1]))
  }

  private static func lengthOfLIS(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }

    // 35 题答案，二分法查找插入位置
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
      guard !nums.isEmpty else { return 0 }

      var left = 0
      var right = nums.count - 1

      while left <= right {
        let index = (left + right) / 2
        if nums[index] == target {
          return index
        } else if nums[index] > target {
          right = index - 1
        } else {
          left = index + 1
        }
      }

      if right < 0 {
        return 0
      } else if left >= nums.count {
        return nums.count
      } else {
        return left
      }
    }

    var lis: [Int] = []
    for i in 0..<nums.count {
      let num = nums[i]

      if lis.isEmpty {
        lis.append(num)
        continue
      }

      if lis.last! < num {
        lis.append(num)
        continue
      }
      
      let replaceIndex = searchInsert(lis, num)
      lis[replaceIndex] = num
    }

    return lis.count
  }

  // DP 时间复杂度 O(n2)
  private static func lengthOfLIS1(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }

    var dp: [Int] = Array(repeating: 1, count: nums.count)

    for i in 1..<nums.count {
      var maxCount = 0

      for j in 0..<i {
        if nums[i] > nums[j] {
          maxCount = max(maxCount, dp[j])
        }
      }
      dp[i] = maxCount + 1
    }
    return dp.max() ?? 0
  }
}
