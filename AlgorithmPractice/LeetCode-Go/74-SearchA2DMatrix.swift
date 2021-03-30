//
//  74-SearchA2DMatrix.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/30.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 74. 搜索二维矩阵
 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：

 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。

 示例 1：
 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 输出：true

 示例 2：
 输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 输出：false

 提示：
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-a-2d-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test74() {
//    print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 16))
//    print(searchMatrix([[1,3,5,7],[10,11,16,20]], 6))
//    print(searchMatrix([[1,3,5,7]], 16))

//    print(searchMatrix([[1],[10],[23]], 10))
    print(searchMatrix([[1, 3], [10, 11], [23, 30]], 12))
    print(searchMatrix([[1]], 1))
  }

  // 两次二分，时间复杂度为 O(logm + logn) = O(logm*n)
  private static func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard let row = matrix.first, !row.isEmpty else { return false }

    var start = 0
    var end = matrix.count - 1
    var midIndex = 0
    
    // 按行进行二分查找，找到该元素所属的行
    while start <= end {
      midIndex = (start + end) / 2
      guard let mid = matrix[midIndex].first else {
        return false
      }
      // 正好为行首元素，则返回 true
      if mid == target {
        return true
      }
      // 行首元素大于目标值，更新 end
      if mid > target {
        end = midIndex - 1
      } else {
        // 若为最后一行，最后一行为需要找的行
        if midIndex + 1 >= matrix.count {
          break
        }
        // 若不是最后一行，则判断下一行的行首元素是否大于目标值，若大，则当前行为需要找的行
        if let item = matrix[midIndex + 1].first,
           item > target {
          break
        }
        // 继续二分
        start = midIndex + 1
      }
    }

    let currentRow = matrix[midIndex]
    start = 0
    end = currentRow.count - 1
    midIndex = 0

    while start <= end {
      midIndex = (start + end) / 2
      let mid = currentRow[midIndex]

      if mid == target {
        return true
      }
      if mid > target {
        end = midIndex - 1
      } else {
        start = midIndex + 1
      }
    }

    return false
  }
}
