//
//  115-DistinctSubsequences.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/17.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 115. 不同的子序列
 给定一个字符串 s 和一个字符串 t ，计算在 s 的子序列中 t 出现的个数。

 字符串的一个 子序列 是指，通过删除一些（也可以不删除）字符且不干扰剩余字符相对位置所组成的新字符串。（例如，"ACE" 是 "ABCDE" 的一个子序列，而 "AEC" 不是）

 题目数据保证答案符合 32 位带符号整数范围。

 示例 1：

 输入：s = "rabbbit", t = "rabbit"
 输出：3
 解释：
 如下图所示, 有 3 种可以从 s 中得到 "rabbit" 的方案。
 (上箭头符号 ^ 表示选取的字母)
 rabbbit
 ^^^^ ^^
 rabbbit
 ^^ ^^^^
 rabbbit
 ^^^ ^^^
 示例 2：

 输入：s = "babgbag", t = "bag"
 输出：5
 解释：
 如下图所示, 有 5 种可以从 s 中得到 "bag" 的方案。
 (上箭头符号 ^ 表示选取的字母)
 babgbag
 ^^ ^
 babgbag
 ^^    ^
 babgbag
 ^    ^^
 babgbag
   ^  ^^
 babgbag
     ^^^

 提示：

 0 <= s.length, t.length <= 1000
 s 和 t 由英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/distinct-subsequences
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test115() {
    print(numDistinct("rabbbit", "rabbit"))
    print(numDistinct("babgbag", "bag"))
    print(numDistinct("", ""))
    print(numDistinct("", "1"))
  }

  private static func numDistinct(_ s: String, _ t: String) -> Int {
    let sCount = s.count
    let tCount = t.count
    guard tCount > 0, sCount >= tCount else {
      return 0
    }

    let sArray = Array(s)
    let tArray = Array(t)

    // dp[i][j] 表示 s[0...i] 中包含 t[0...j] 的个数
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: tCount), count: sCount)

    // 初始值，dp[i][0] 为 s[0...i] 中出现 t[0] 的个数，dp[0][1...n] 默认为 0
    if sArray[0] == tArray[0] {
      dp[0][0] = 1
    }
    for i in 1..<sCount {
      if sArray[i] == tArray[0] {
        dp[i][0] = dp[i-1][0] + 1
      } else {
        dp[i][0] = dp[i-1][0]
      }
    }

    for i in 1..<sCount {
      for j in 1..<tCount {
        if sArray[i] == tArray[j] {
          dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
        } else {
          dp[i][j] = dp[i-1][j]
        }
      }
    }

    return dp.last?.last ?? 0
  }
}
