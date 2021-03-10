//
//  224-BasicCalculator.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/10.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 224. 基本计算器
 实现一个基本的计算器来计算一个简单的字符串表达式 s 的值。

 示例 1：

 输入：s = "1 + 1"
 输出：2
 示例 2：

 输入：s = " 2-1 + 2 "
 输出：3
 示例 3：

 输入：s = "(1+(4+5+2)-3)+(6+8)"
 输出：23

 提示：

 1 <= s.length <= 3 * 105
 s 由数字、'+'、'-'、'('、')'、和 ' ' 组成
 s 表示一个有效的表达式
 */

extension Solution {
  static func test224() {
//    print(calculate("+"))
//    print(calculate("(-1)"))
    print(calculate("(5-(1+(5)))"))
//    print(calculate("+"))
//    print(calculate("2-(5-6)"))
//    print(calculate("2+(5-6)"))
//    print(calculate("1 - (1 + 17) + ( 23 - 8 )"))
//    print(calculate(" 2-1 + 2 "))
//    print(calculate("((1 + (4 + 5 + 2) - 3) + (6 + 8))"))
  }

  private static func calculate(_ s: String) -> Int {
    let str = "(\(s))"
    var stack: [Character] = []

    func calculatePart(_ part: [Character]) -> Int {
      var chars = part
      var num = 0
      var numStr = ""
      var op = ""

      func cal(_ ope: String) {
        if op.isEmpty {
          op = ope
          num = Int(numStr) ?? 0
          numStr = ""
        } else {
          if op == "+" {
            num = num + (Int(numStr) ?? 0)
          } else {
            num = num - (Int(numStr) ?? 0)
          }
          numStr = ""
          op = ope
        }
      }

      while !chars.isEmpty {
        let char = String(chars.removeLast())
        switch char {
        case "-", "+":
          cal(char)
        default:
          numStr += char
        }
      }

      var result = 0
      if op == "-" {
        result = num - (Int(numStr) ?? 0)
      } else {
        result = num + (Int(numStr) ?? 0)
      }
      return result
    }

    for char in str {
      switch char {
      case Character(" "):
        continue
      case Character("+"), Character("-"), Character("("):
        stack.append(char)
      case Character(")"):
        var calculateStack: [Character] = []
        while !stack.isEmpty, stack.last != "(" {
          calculateStack.append(stack.removeLast())
        }
        stack.removeLast()

        let res = calculatePart(calculateStack)
        if let last = stack.last, res < 0 {
          if last != "(", last != ")" {
            stack.removeLast()
          }

          if last == "-" {
            stack.append(contentsOf: "+\(abs(res))")
          } else {
            stack.append(contentsOf: "\(res)")
          }
        } else {
          stack.append(contentsOf: "\(res)")
        }
      default:
        stack.append(char)
      }
    }
    return Int(String(stack)) ?? 0
  }
}
