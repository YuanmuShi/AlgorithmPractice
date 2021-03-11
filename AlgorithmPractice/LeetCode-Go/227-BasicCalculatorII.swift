//
//  227-BasicCalculatorII.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/3/11.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 227. 基本计算器 II

 给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。
 整数除法仅保留整数部分。

 示例 1：

 输入：s = "3+2*2"
 输出：7
 示例 2：

 输入：s = " 3/2 "
 输出：1
 示例 3：

 输入：s = " 3+5 / 2 "
 输出：5

 提示：

 1 <= s.length <= 3 * 105
 s 由整数和算符 ('+', '-', '*', '/') 组成，中间由一些空格隔开
 s 表示一个 有效表达式
 表达式中的所有整数都是非负整数，且在范围 [0, 231 - 1] 内
 题目数据保证答案是一个 32-bit 整数

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/basic-calculator-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test227() {
    print(calculate("-3+2*2"))
    print(calculate("13-2*2"))
    print(calculate(" 3+5 / 2 "))
  }

  // 参考题解 https://leetcode-cn.com/problems/basic-calculator-ii/solution/xian-cheng-chu-zai-jia-jian-yong-zhan-ba-hplr/
  private static func calculate(_ s: String) -> Int {
    let str = s.replacingOccurrences(of: " ", with: "")
    let strArray = Array(str)
    let count = strArray.count

    var preOp = "+"
    var num = 0
    var nums: [Int] = []

    for i in 0 ..< count {
      let item = String(strArray[i])

      let n = Int(item)
      if n != nil {
        num = num * 10 + n!
      }

      if n == nil || i >= count - 1 {
        if preOp == "+" {
          nums.append(num)
        } else if preOp == "-" {
          nums.append(-num)
        } else if preOp == "*", let last = nums.last {
          nums.removeLast()
          nums.append(last * num)
        } else if preOp == "/", let last = nums.last {
          nums.removeLast()
          nums.append(last / num)
        }
        preOp = item
        num = 0
      }
    }

    return nums.reduce(0) { $0 + $1 }
  }
}
