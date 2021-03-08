//
//  132-PalindromePartitioningII.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/8.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 132. 分割回文串 II
 给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是回文。

 返回符合要求的 最少分割次数 。

 示例 1：

 输入：s = "aab"
 输出：1
 解释：只需一次分割就可将 s 分割成 ["aa","b"] 这样两个回文子串。
 示例 2：

 输入：s = "a"
 输出：0
 示例 3：

 输入：s = "ab"
 输出：1

 提示：

 1 <= s.length <= 2000
 s 仅由小写英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-partitioning-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test132() {
//    print(minCut("ababababababababababababcbabababababababababababa"))
//    print(minCut("abba"))
//    print(minCut("a"))
//    print(minCut("ab"))
//    print(minCut("abbab"))
//    print(minCut("abb"))

    print(minCut("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))
  }

  private static func minCut(_ s: String) -> Int {
    guard !s.isEmpty else { return 0 }
    let count = s.count
    let arrayS = Array(s)

    var p: [[Bool]] = Array(repeating: Array(repeating: false, count: count), count: count)
    for l in 0..<count {
      for i in 0..<(count - l) {
        let j = i + l
        if l == 0 {
          p[i][j] = true
          continue
        }

        let iStr = arrayS[i]
        let jStr = arrayS[j]

        if l == 1 {
          p[i][j] = iStr == jStr
        } else if iStr == jStr {
          p[i][j] = p[i + 1][j - 1]
        }
      }
    }

    var dp: [Int] = Array(repeating: Int.max, count: s.count)
    for i in 0..<count {
      if p[0][i] {
        dp[i] = 0
        continue
      }

      for j in 0..<i {
        if p[j + 1][i] {
          dp[i] = min(dp[i], dp[j] + 1)
        }
      }
    }
    return dp[count - 1]
  }

  // 超时做法
  // 131 的方式，将所有分割方式列出，取出其中最小的情况
  private static func minCut1(_ s: String) -> Int {
    guard !s.isEmpty else { return 0 }
    let count = s.count
    var results: [Int] = []
    var r: [String] = []

    // 记忆化搜索，palindrome[i][j] = 0 表示未搜索，1 表示是回文串，-1 表示不是回文串
    var palindrome: [[Int]] = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
    func checkPalindrome(_ start: Int, _ end: Int) -> Bool {
      if palindrome[start][end] != 0 {
        return palindrome[start][end] > 0
      }

      var startIndex = start
      var endIndex = end
      var isPalindrome = true

      while startIndex <= endIndex {
        let sIndex = s.index(s.startIndex, offsetBy: startIndex)
        let eIndex = s.index(s.startIndex, offsetBy: endIndex)

        if String(s[sIndex]) != String(s[eIndex]) {
          isPalindrome = false
          break
        }
        startIndex += 1
        endIndex -= 1
      }

      palindrome[start][end] = isPalindrome ? 1 : 0
      return palindrome[start][end] > 0
    }

    func dfs(_ index: Int) {
      guard index < count else {
        results.append(r.count)
        return
      }

      for i in index..<count {
        let tmpIndex = s.index(s.startIndex, offsetBy: index)..<s.index(s.startIndex, offsetBy: i + 1)

        if checkPalindrome(index, i) {
          r.append(String(s[tmpIndex]))
          dfs(i + 1)
          r.removeLast()
        }
      }
    }

    dfs(0)
    return (results.min() ?? 0) - 1
  }

  // 超时
  private func minCut2(_ s: String) -> Int {
    guard !s.isEmpty else { return 0 }
    let count = s.count

    // 判断是否是回文字符串
    func checkPalindrome(_ str: String) -> Bool {
      // 空字符串和单个字符是回文
      guard str.count > 1 else { return true }

      var start = 0
      var end = str.count - 1
      var result = true

      while start <= end {
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)

        if String(str[startIndex]) != String(str[endIndex]) {
          result = false
          break
        }
        start += 1
        end -= 1
      }
      return result
    }

    var dp: [Int] = Array(repeating: Int.max, count: s.count)

    for i in 0..<count {
      // s[0...i] 为回文字符串，则无需切割。其中 s[0] 代表第一个字母，swift 中取第一个字母的方法为 s.prefix(1)
      if checkPalindrome(String(s.prefix(i + 1))) {
        dp[i] = 0
        continue
      }

      for j in 0..<i {
        let subIndex = s.index(s.startIndex, offsetBy: j + 1) ... s.index(s.startIndex, offsetBy: i)
        let subStr = String(s[subIndex])
        if checkPalindrome(subStr) {
          dp[i] = min(dp[i], dp[j] + 1)
        }
      }
    }
    return dp[count - 1]
  }
}
