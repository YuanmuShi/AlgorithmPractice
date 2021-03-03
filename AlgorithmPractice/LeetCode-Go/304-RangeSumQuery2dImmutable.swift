//
//  304-RangeSumQuery2dImmutable.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/2.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 304. 二维区域和检索 - 矩阵不可变
 给定一个二维矩阵，计算其子矩形范围内元素的总和，该子矩阵的左上角为 (row1, col1) ，右下角为 (row2, col2) 。

 上图子矩阵左上角 (row1, col1) = (2, 1) ，右下角(row2, col2) = (4, 3)，该子矩形内元素的总和为 8。

 示例：

 给定 matrix = [
   [3, 0, 1, 4, 2],
   [5, 6, 3, 2, 1],
   [1, 2, 0, 1, 5],
   [4, 1, 0, 1, 7],
   [1, 0, 3, 0, 5]
 ]

 sumRegion(2, 1, 4, 3) -> 8
 sumRegion(1, 1, 2, 2) -> 11
 sumRegion(1, 2, 2, 4) -> 12

 提示：

 你可以假设矩阵不可变。
 会多次调用 sumRegion 方法。
 你可以假设 row1 ≤ row2 且 col1 ≤ col2 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/range-sum-query-2d-immutable
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 二维前缀和
class NumMatrix {
  private let matrix: [[Int]]
  private var preSum: [[Int]] = []

  init(_ matrix: [[Int]]) {
    self.matrix = matrix

    guard let firstRow = matrix.first,
          !firstRow.isEmpty else {
      return
    }

    preSum = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)

    // preSum[i][j] = preSum[i-1][j] + preSum[i][j-1] - preSum[i-1][j-1] + matrix[i][j]
    for i in 1 ... matrix.count {
      for j in 1 ... matrix[i-1].count {
        preSum[i][j] = preSum[i - 1][j] + preSum[i][j - 1] - preSum[i - 1][j - 1] + matrix[i-1][j-1]
      }
    }
  }

  func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
    guard row1 <= row2,
          col1 <= col2,
          row2 < matrix.count,
          col1 < matrix[row1].count,
          col2 < matrix[row2].count
    else {
      return 0
    }
    
    return preSum[row2 + 1][col2 + 1] - preSum[row2 + 1][col1] - preSum[row1][col2 + 1] + preSum[row1][col1]
  }
}

/*
// 参照 303，对 行维度进行前缀和
class NumMatrix {
  private var matrix: [[Int]]
  private var rowPreSum: [[Int]] = []

  init(_ matrix: [[Int]]) {
    self.matrix = matrix

    for row in 0 ..< matrix.count {
      let nums = matrix[row]

      var tmp: [Int] = Array(repeating: 0, count: nums.count + 1)
      for i in 1 ... nums.count {
        tmp[i] = tmp[i - 1] + nums[i - 1]
      }
      rowPreSum.append(tmp)
    }
  }

  func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
    guard row1 <= row2,
          col1 <= col2,
          row2 < matrix.count,
          col1 < matrix[row1].count,
          col2 < matrix[row2].count
    else {
      return 0
    }

    var result = 0
    for row in row1 ... row2 {
      let preSum = rowPreSum[row]
      result += preSum[col2 + 1] - preSum[col1]
    }
    return result
  }
}
*/

/*
  暴力法 LeetCode 超时
 class NumMatrix {
   private var matrix: [[Int]]

   init(_ matrix: [[Int]]) {
     self.matrix = matrix
   }

   func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
     guard row1 <= row2,
           col1 <= col2,
           row2 < matrix.count,
           col1 < matrix[row1].count,
           col2 < matrix[row2].count
     else {
       return 0
     }

     var result = 0
     for row in row1...row2 {
       for col in col1...col2 {
         result += matrix[row][col]
       }
     }
     return result
   }
 }
 */
