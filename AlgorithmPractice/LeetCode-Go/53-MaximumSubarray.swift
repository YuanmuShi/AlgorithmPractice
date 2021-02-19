//
//  53-MaximumSubarray.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/2/19.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 53. 最大子序和
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 示例 1：

 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：

 输入：nums = [1]
 输出：1
 示例 3：

 输入：nums = [0]
 输出：0
 示例 4：

 输入：nums = [-1]
 输出：-1
 示例 5：

 输入：nums = [-100000]
 输出：-100000

 提示：

 1 <= nums.length <= 3 * 104
 -105 <= nums[i] <= 105

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test53() {
//    print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
    print(maxSubArray([1, 2]))
  }

  private static func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 1 else { return nums.first ?? 0 }
    
    var dp: [Int] = Array(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var result = nums[0]
    for i in 1 ..< nums.count {
      dp[i] = max(dp[i - 1] + nums[i], nums[i])
      result = max(result, dp[i])

//      let t = max(num, result + num)
//      result = max(t, result)
    }

    return result
  }
}
