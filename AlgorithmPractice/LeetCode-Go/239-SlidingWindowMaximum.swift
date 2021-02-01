//
//  239-SlidingWindowMaximum.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/13.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 239. 滑动窗口最大值
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

 返回滑动窗口中的最大值。

  

 示例 1：

 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 示例 2：

 输入：nums = [1], k = 1
 输出：[1]
 示例 3：

 输入：nums = [1,-1], k = 1
 输出：[1,-1]
 示例 4：

 输入：nums = [9,11], k = 2
 输出：[11]
 示例 5：

 输入：nums = [4,-2], k = 2
 输出：[4]
  

 提示：

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length
 */

extension Solution {
  /*
   https://leetcode-cn.com/problems/sliding-window-maximum/solution/swift-san-chong-jie-fa-dui-ying-de-hao-shi-by-leav/
   三种解法：
   1. 平移区间暴力求解
   2. 如下模拟双端队列
   3. 动态规划，未仔细看
   */
  
  static func test239() {
//    print(Self.maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3))
    print(Self.maxSlidingWindow([1, -9, 8, -6, 6, 4, 0, 5], 4))
//    print(Self.maxSlidingWindow([7, 2, 4], 2))
//    print(Self.maxSlidingWindow([1, -1], 1))
//    print(Self.maxSlidingWindow([1, 3, 1, 2, 0, 5], 3))
//    print(Self.maxSlidingWindow([9, 10, 9, -7, -4, -8, 2, -6], 5))
  }
  
  private static func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
    var results: [Int] = []
    var kIndexs: [Int] = []
    
    for index in 0 ..< nums.count {
      if let first = kIndexs.first,
         first == index - k {
        kIndexs.removeFirst()
      }
      
      while !kIndexs.isEmpty, nums[kIndexs.last!] < nums[index] {
        kIndexs.removeLast()
      }
      kIndexs.append(index)
      
      if index >= k - 1, let first = kIndexs.first {
        results.append(nums[first])
      }
    }
    
    return results
  }
  
  // 超时代码
  private static func maxSlidingWindow1(_ nums: [Int], _ k: Int) -> [Int] {
    guard k > 1 else {
      return nums
    }
    
    var results: [Int] = []
    var kNums: [Int] = []
    
    for i in 0 ..< nums.count {
      let num = nums[i]
      if i < k - 1 {
        if let first = kNums.first,
           first >= num {
          kNums.append(num)
        } else {
          kNums = [num]
        }
      } else {
        if kNums.count >= k {
          kNums = Array(kNums.dropFirst())
          let max = kNums.max { $0 < $1 } ?? kNums[0]
          let index = kNums.firstIndex(of: max) ?? 0
          
          kNums = Array(kNums[index ..< kNums.count])
        }
        
        if kNums[0] > num {
          kNums.append(num)
        } else {
          kNums = [num]
        }
        
        results.append(kNums[0])
      }
    }
    
    return results
  }
}
