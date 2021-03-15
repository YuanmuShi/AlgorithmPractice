//
//  54-SpiralMatrix.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/15.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 54. 螺旋矩阵
 给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

 示例 1：

 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 示例 2：

 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]

 提示：

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/spiral-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test54() {
    print(spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]))
    print(spiralOrder([[1, 2, 3, 4], [5, 6, 7, 8]]))
    print(spiralOrder([[1], [2], [3]]))
  }

  // 感觉主要考察边界处理
  private static func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    let m = matrix.count
    let n = matrix.first?.count ?? 0

    var left = 0
    var top = 0
    var right = n - 1
    var bottom = m - 1

    var result: [Int] = []

    while right >= left, bottom >= top {
      for i in left...right {
        result.append(matrix[top][i])
      }
      top += 1

      if bottom >= top {
        for i in top...bottom {
          result.append(matrix[i][right])
        }
        right -= 1
      }

      if left <= right, bottom >= top {
        for i in (left...right).reversed() {
          result.append(matrix[bottom][i])
        }
        bottom -= 1
      }

      if left <= right, bottom >= top {
        for i in (top...bottom).reversed() {
          result.append(matrix[i][left])
        }
        left += 1
      }
    }
    return result
  }
}
