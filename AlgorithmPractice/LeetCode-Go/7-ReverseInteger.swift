//
//  7-ReverseInteger.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/22.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 7. 整数反转
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。

 示例 1：

 输入：x = 123
 输出：321
 示例 2：

 输入：x = -123
 输出：-321
 示例 3：

 输入：x = 120
 输出：21
 示例 4：

 输入：x = 0
 输出：0

 提示：

 -231 <= x <= 231 - 1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test7() {
//    print(reverse(123))
    print(reverse(-123))
//    print(reverse(0))
//    print(reverse(-1))
//    print(reverse(1534236469))
  }

  private static func reverse(_ x: Int) -> Int {
    var rev = 0
    var temp = x
    while temp != 0 {
      let n = temp % 10
      temp = temp / 10
      rev = rev * 10 + n
    }

    if rev > Int32.max || rev < Int32.min {
      return 0
    }

    return rev
  }

  private static func reverse1(_ x: Int) -> Int {
    guard x <= Int32.max, x >= Int32.min else { return 0 }

    let positive = x >= 0
    var num = positive ? x : -x
    var queue: [Int] = []

    while num > 0 {
      queue.append(num % 10)
      num = num / 10
    }

    var result = 0
    for dig in queue {
      result = result * 10 + dig
    }

    result = positive ? result : -result

    if result > Int32.max || result < Int32.min {
      return 0
    }

    return result
  }
}
