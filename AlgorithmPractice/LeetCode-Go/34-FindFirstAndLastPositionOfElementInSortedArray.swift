//
//  34-FindFirstAndLastPositionOfElementInSortedArray.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/2/3.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 34. 在排序数组中查找元素的第一个和最后一个位置
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 如果数组中不存在目标值 target，返回 [-1, -1]。

 进阶：

 你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？

 示例 1：

 输入：nums = [5,7,7,8,8,10], target = 8
 输出：[3,4]
 示例 2：

 输入：nums = [5,7,7,8,8,10], target = 6
 输出：[-1,-1]
 示例 3：

 输入：nums = [], target = 0
 输出：[-1,-1]

 提示：

 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 nums 是一个非递减数组
 -109 <= target <= 109
 */

extension Solution {
  static func test34() {
    print(searchRange([7, 7, 7, 8, 8, 8], 8))
  }

  private static func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard !nums.isEmpty else {
      return [-1, -1]
    }

    var minIndex = -1
    var maxIndex = -1

    func findLeft() {
      var left = 0
      var right = nums.count - 1

      while left <= right {
        let index = (left + right) / 2
        let mid = nums[index]

        if target <= mid {
          right = index - 1
        } else {
          left = index + 1
        }
      }

      if left < nums.count, nums[left] == target {
        minIndex = left
      }
    }

    func findRight() {
      var left = 0
      var right = nums.count - 1

      while left <= right {
        let index = (left + right) / 2
        let mid = nums[index]

        if target >= mid {
          left = index + 1
        } else {
          right = index - 1
        }
      }

      if right >= 0, nums[right] == target {
        maxIndex = right
      }
    }

    findLeft()
    findRight()

    return [minIndex, maxIndex]

//    func searchIndex(_ findMax: Bool) {
//      var left = 0
//      var right = nums.count - 1
//
//      while left <= right {
//        let index = (left + right) / 2
//        let mid = nums[index]
//
//        if target == mid {
//          if findMax {
//            if index == nums.count - 1 {
//              maxIndex = index
//              return
//            }
//            if nums[index + 1] > target {
//              maxIndex = index
//              return
//            } else {
//              left = index + 1
//            }
//          } else {
//            if index == 0 {
//              minIndex = 0
//              return
//            }
//            if nums[index - 1] < target {
//              minIndex = index
//              return
//            } else {
//              right = index - 1
//            }
//          }
//        } else if target > mid {
//          left = index + 1
//        } else {
//          right = index - 1
//        }
//      }
//    }

//    searchIndex(false)
//    searchIndex(true)
  }
}
