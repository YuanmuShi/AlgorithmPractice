//
//  131-PalindromePartitioning.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/2/9.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 131. 分割回文串

 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。

 返回 s 所有可能的分割方案。

 示例:

 输入: "aab"
 输出:
 [
   ["aa","b"],
   ["a","a","b"]
 ]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/palindrome-partitioning
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test131() {
   print(partition("aab"))
  }
  
  // 回溯法
  private static func partition(_ s: String) -> [[String]] {
    guard !s.isEmpty else { return [[]] }

    var allPaths: [[String]] = []
    var tmpPaths: [String] = []

    func recursion(_ sub: String) {
      guard !sub.isEmpty else {
        allPaths.append(tmpPaths)
        return
      }

      for i in 1 ... sub.count {
        let r = String(sub.prefix(i))
        if checkPalindrome(r) {
          tmpPaths.append(r)
          let ss = String(sub.dropFirst(i))
          recursion(ss)
        } else {
          continue
        }
        tmpPaths.removeLast()
      }
    }

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

    recursion(s)
    return allPaths
  }
}
