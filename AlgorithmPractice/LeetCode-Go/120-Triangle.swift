//
//  120-Triangle.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/2/4.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 120. 三角形最小路径和
 给定一个三角形 triangle ，找出自顶向下的最小路径和。

 每一步只能移动到下一行中相邻的结点上。相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。也就是说，如果正位于当前行的下标 i ，那么下一步可以移动到下一行的下标 i 或 i + 1 。

 示例 1：

 输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 输出：11
 解释：如下面简图所示：
    2
   3 4
  6 5 7
 4 1 8 3
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 示例 2：

 输入：triangle = [[-10]]
 输出：-10

 提示：

 1 <= triangle.length <= 200
 triangle[0].length == 1
 triangle[i].length == triangle[i - 1].length + 1
 -104 <= triangle[i][j] <= 104

 进阶：

 你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/triangle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test120() {
    let triangle = [[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]
//    let triangle: [[Int]] = [[2]]
    print(minimumTotal(triangle))
  }

  // DP 改进
  private static func minimumTotal(_ triangle: [[Int]]) -> Int {
    guard !triangle.isEmpty else { return 0 }
    var dp: [Int] = triangle.last!

    for row in (0 ..< (triangle.count - 1)).reversed() {
      for col in 0 ..< triangle[row].count {
        dp[col] = min(dp[col], dp[col + 1]) + triangle[row][col]
      }
    }
    return dp[0]
  }
  
  // DP
  private static func minimumTotal2(_ triangle: [[Int]]) -> Int {
    guard !triangle.isEmpty else { return 0 }
    var dp: [[Int]] = Array(repeating: [Int](), count: triangle.count - 1)
    var lastRow: [Int] = []
    triangle[triangle.count - 1].forEach { lastRow.append($0) }
    dp.append(lastRow)

    for row in (0 ..< (triangle.count - 1)).reversed() {
      var tmpRow: [Int] = []
      for col in 0 ..< triangle[row].count {
        tmpRow.append(min(dp[row + 1][col], dp[row + 1][col + 1]) + triangle[row][col])
      }
      dp[row] = tmpRow
    }

    return dp[0][0]
  }

  // 递归 找到所有路径，并计算出所有路径的中最小值 LeetCode 上超时
  private static func minimumTotal1(_ triangle: [[Int]]) -> Int {
    var allPaths: [Int] = []

    func recursion(row: Int, col: Int, sum: Int) {
      guard row < triangle.count, col < triangle[row].count else { return }
      let tmp = sum + triangle[row][col]
      if row == triangle.count - 1 {
        allPaths.append(tmp)
      } else {
        recursion(row: row + 1, col: col, sum: tmp)
        recursion(row: row + 1, col: col + 1, sum: tmp)
      }
    }
    recursion(row: 0, col: 0, sum: 0)

    return allPaths.min() ?? 0
  }
}
