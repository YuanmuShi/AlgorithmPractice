//
//  73-SetMatrixZeroes.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/21.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 73. 矩阵置零
 给定一个 m x n 的矩阵，如果一个元素为 0 ，则将其所在行和列的所有元素都设为 0 。请使用 原地 算法。

 进阶：

 一个直观的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
 你能想出一个仅使用常量空间的解决方案吗？

 示例 1：
 输入：matrix = [[1,1,1],[1,0,1],[1,1,1]]
 输出：[[1,0,1],[0,0,0],[1,0,1]]

 示例 2：
 输入：matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
 输出：[[0,0,0,0],[0,4,5,0],[0,3,1,0]]

 提示：

 m == matrix.length
 n == matrix[0].length
 1 <= m, n <= 200
 -231 <= matrix[i][j] <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/set-matrix-zeroes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test73() {
//    var matrix = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
//    var matrix: [[Int]] = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
    var matrix: [[Int]] = [[0, 3, 1], [1, 4, 3], [2, 5, 1], [1, 0, 5]]
    setZeroes(&matrix)
    print(matrix)
  }

  private static func setZeroes(_ matrix: inout [[Int]]) {
    var firstRowHasZero = false
    var firstColHasZero = false

    for rowIndex in 0..<matrix.count {
      let row = matrix[rowIndex]
      firstColHasZero = firstColHasZero || ((row.first ?? 0) == 0)

      for colIndex in 0..<row.count {
        let col = row[colIndex]

        if rowIndex == 0 {
          firstRowHasZero = firstRowHasZero || (col == 0)
        }

        if col == 0 {
          matrix[0][colIndex] = 0
          matrix[rowIndex][0] = 0
        }
      }
    }

    if matrix.count > 0 {
      for rowIndex in 1..<matrix.count {
        let row = matrix[rowIndex]
        if row.count > 0 {
          for colIndex in 1..<row.count {
            if matrix[0][colIndex] == 0 || matrix[rowIndex][0] == 0 {
              matrix[rowIndex][colIndex] = 0
            }
          }
        }
      }
    }

    if firstRowHasZero, matrix.count > 0 {
      for index in 0..<matrix[0].count {
        matrix[0][index] = 0
      }
    }

    if firstColHasZero {
      for index in 0..<matrix.count {
        matrix[index][0] = 0
      }
    }
  }
}
