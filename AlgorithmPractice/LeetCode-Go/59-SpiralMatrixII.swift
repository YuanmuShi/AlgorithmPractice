//
//  59-SpiralMatrixII.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/15.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 59. 螺旋矩阵 II
 给你一个正整数 n ，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的 n x n 正方形矩阵 matrix 。

 示例 1：

 输入：n = 3
 输出：[[1,2,3],[8,9,4],[7,6,5]]
 示例 2：

 输入：n = 1
 输出：[[1]]

 提示：

 1 <= n <= 20

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/spiral-matrix-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test59() {
    print(generateMatrix(1))
    print(generateMatrix(2))
    print(generateMatrix(3))
    print(generateMatrix(4))
    print(generateMatrix(5))
  }

  private static func generateMatrix(_ n: Int) -> [[Int]] {
    guard n > 0 else { return [] }
    var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    var left = 0
    var top = 0
    var right = n - 1
    var bottom = n - 1

    var value = 1

    while right >= left, bottom >= top {
      for i in left...right {
        matrix[top][i] = value
        value += 1
      }
      top += 1

      if bottom >= top {
        for i in top...bottom {
          matrix[i][right] = value
          value += 1
        }
        right -= 1
      }

      if left <= right, bottom >= top {
        for i in (left...right).reversed() {
          matrix[bottom][i] = value
          value += 1
        }
        bottom -= 1
      }

      if left <= right, bottom >= top {
        for i in (top...bottom).reversed() {
          matrix[i][left] = value
          value += 1
        }
        left += 1
      }
    }
    return matrix
  }
}
