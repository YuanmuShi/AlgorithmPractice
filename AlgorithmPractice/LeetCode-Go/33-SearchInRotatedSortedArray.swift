//
//  33-SearchInRotatedSortedArray.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/2/5.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 33. 搜索旋转排序数组
 升序排列的整数数组 nums 在预先未知的某个点上进行了旋转（例如， [0,1,2,4,5,6,7] 经旋转后可能变为 [4,5,6,7,0,1,2] ）。

 请你在数组中搜索 target ，如果数组中存在这个目标值，则返回它的索引，否则返回 -1 。

 示例 1：

 输入：nums = [4,5,6,7,0,1,2], target = 0
 输出：4
 示例 2：

 输入：nums = [4,5,6,7,0,1,2], target = 3
 输出：-1
 示例 3：

 输入：nums = [1], target = 0
 输出：-1

 提示：

 1 <= nums.length <= 5000
 -10^4 <= nums[i] <= 10^4
 nums 中的每个值都 独一无二
 nums 肯定会在某个点上旋转
 -10^4 <= target <= 10^4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test33() {
    print(search([4,5,6,7,0,1,2], 0))
  }

  private static func search(_ nums: [Int], _ target: Int) -> Int {
    guard !nums.isEmpty else { return -1 }

    var left = 0
    var right = nums.count - 1
    
    while left <= right {
      let index = (left + right) / 2
      let mid = nums[index]
      
      if mid == target {
        return index
      }
      
      if mid < target {
        if nums[index + 1] < nums[right] {
          left = index + 1
        } else {
          
        }
      } else {
        right = index - 1
      }
    }

    return -1
  }
}
