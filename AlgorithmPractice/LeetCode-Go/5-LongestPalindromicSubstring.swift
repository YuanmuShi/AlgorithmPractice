//
//  5-LongestPalindromicSubstring.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/9.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 5. 最长回文子串
 给你一个字符串 s，找到 s 中最长的回文子串。

 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
 示例 3：

 输入：s = "a"
 输出："a"
 示例 4：

 输入：s = "ac"
 输出："a"

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母（大写和/或小写）组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test5() {
    print(longestPalindrome("babad"))
    print(longestPalindrome("b"))
    print(longestPalindrome("bb"))
    print(longestPalindrome("ba"))
    print(longestPalindrome("cbbc"))
    print(longestPalindrome("aaaa"))
  }

  private static func longestPalindrome(_ s: String) -> String {
    let count = s.count
    guard count > 1 else { return s }

    let arrayS = Array(s)
    var begin = 0
    var end = 0

    func searchPalindrome(_ center: Int, _ centerRight: Int? = nil) {
      var left = center - 1
      var right = center + 1
      if let cr = centerRight {
        left = center
        right = cr
      }

      while left >= 0, right < count {
        if arrayS[left] == arrayS[right] {
          if right - left > end - begin {
            begin = left
            end = right
          }
          left -= 1
          right += 1
        } else {
          break
        }
      }
    }

    for i in 0 ..< count {
      searchPalindrome(i)
      searchPalindrome(i, i + 1)
    }

    var result = ""
    for i in begin ... end {
      result.append(arrayS[i])
    }
    return result
  }

  // DP
  private static func longestPalindrome1(_ s: String) -> String {
    let count = s.count
    let arrayS = Array(s)
    guard count > 2 else {
      if count == 2 {
        return arrayS[0] == arrayS[1] ? s : String(arrayS[0])
      }
      return s
    }

    var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: count), count: count)
    var begin = 0
    var end = 0

    // 因为动态转移方程是 dp[i][j] = dp[i + 1][j - 1] && s[i] == s[j]
    // 是从左下向右上移动，因此按行遍历会出错，应该按列遍历
    for j in 0 ..< count {
      for i in 0 ... j {
        if i == j {
          dp[i][j] = true
        } else if i + 1 == j {
          dp[i][j] = arrayS[i] == arrayS[j]
        } else if arrayS[i] == arrayS[j] {
          dp[i][j] = dp[i + 1][j - 1]
        }

        if dp[i][j],
           j - i > end - begin {
          begin = i
          end = j
        }
      }
    }

    var result = ""
    for i in begin ... end {
      result.append(arrayS[i])
    }
    return result
  }
}
