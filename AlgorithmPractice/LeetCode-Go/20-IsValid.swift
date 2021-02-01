//
//  20-IsValid.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/11.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 20. 有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
  

 示例 1：

 输入：s = "()"
 输出：true
 示例 2：

 输入：s = "()[]{}"
 输出：true
 示例 3：

 输入：s = "(]"
 输出：false
 示例 4：

 输入：s = "([)]"
 输出：false
 示例 5：

 输入：s = "{[]}"
 输出：true
  

 提示：

 1 <= s.length <= 104
 s 仅由括号 '()[]{}' 组成
*/

extension Solution {
  static func test20() {
    print("Test 20 result: \(Self.isValid2("({[)"))")
  }
  
  private static func isValid(_ s: String) -> Bool {
    guard !s.isEmpty else {
      return false
    }
    
    var containers: [Character] = []
    
    let pairs: [Character: Character] = [")": "(", "}": "{", "]": "["]
    
    s.forEach { char in
      if pairs.keys.contains(char),
         let pair = pairs[char],
         pair == containers.last {
        containers = containers.dropLast()
      } else {
        containers.append(char)
      }
    }
    
    return containers.isEmpty
  }
    
  private static func isValid2(_ s: String) -> Bool {
    guard !s.isEmpty else {
      return false
    }
    
    var containers: [Character] = []
    let pairs: [Character: Character] = [")": "(", "}": "{", "]": "["]
    
    for char in s {
      if pairs.keys.contains(char) {
        let pair = pairs[char]
        if pair == containers.last {
          containers = containers.dropLast()
        } else {
          return false
        }
      } else {
        containers.append(char)
      }
    }
    
    return containers.isEmpty
  }
}
