//
//  69-Sqrtx.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/2/1.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 69. x 的平方根
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:

 输入: 4
 输出: 2
 示例 2:

 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test69() {
    
    print(mySqrt(9))
  }

  private static func mySqrt(_ x: Int) -> Int {
    guard x != 0, x != 1 else { return x }

    var left = 0
    var right = x

    while (right - left) > 1 {
      let mid = (left + right) / 2
      if mid == x / mid {
        return mid
      } else if mid  < x / mid {
        left = mid
      } else {
        right = mid
      }
    }

    return (left + right) / 2
  }
}
