//
//  70-ClimbingStairs.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/2/4.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 70. 爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test70() {
    print(climbStairs(10))
    print(dp(10))
  }

  private static func climbStairs(_ n: Int) -> Int {
    var cache: [Int: Int] = [:]
    func recursion(_ n: Int) -> Int {
      guard n > 1 else { return 1 }

      if let count = cache[n] {
        return count
      }
      let count = recursion(n - 1) + recursion(n - 2)
      cache[n] = count
      return count
    }

    func dp(_ n: Int) -> Int {
      guard n > 1 else { return 1 }

      var n1 = 1
      var n2 = 1
      (2 ... n).forEach { _ in
        let tmp = n1
        n1 = n1 + n2
        n2 = tmp
      }

      return n1
    }

    return dp(n)
  }
}
