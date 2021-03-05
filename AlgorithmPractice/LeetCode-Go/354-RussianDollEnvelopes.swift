//
//  354-RussianDollEnvelopes.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/4.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 354. 俄罗斯套娃信封问题

 给定一些标记了宽度和高度的信封，宽度和高度以整数对形式 (w, h) 出现。当另一个信封的宽度和高度都比这个信封大的时候，这个信封就可以放进另一个信封里，如同俄罗斯套娃一样。

 请计算最多能有多少个信封能组成一组“俄罗斯套娃”信封（即可以把一个信封放到另一个信封里面）。

 说明:
 不允许旋转信封。

 示例:

 输入: envelopes = [[5,4],[6,4],[6,7],[2,3]]
 输出: 3
 解释: 最多信封的个数为 3, 组合为: [2,3] => [5,4] => [6,7]。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/russian-doll-envelopes
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test354() {
    print(maxEnvelopes([[5, 4], [6, 4], [6, 7], [2, 3]]))
    print(maxEnvelopes([[]]))
  }

  // 本题实质与 300 题相同， 最长子序列的二维化
  private static func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    guard !envelopes.isEmpty else { return 0 }

    var tmpEnvelopes = envelopes
    // 以 W 为维度进行升序排序， 若 W 相同，以 H 维度降序排序
    tmpEnvelopes.sort { (l, r) -> Bool in
      let lW = l.first ?? 0
      let rW = r.first ?? 0
      let lH = l.last ?? 0
      let rH = r.last ?? 0
      if rW == lW {
        return lH > rH
      }
      return rW > lW
    }

    var heights: [Int?] = []
    tmpEnvelopes.forEach { heights.append($0.last) }

    guard !heights.isEmpty else { return 0 }

    // 此方法为 300 题的 O(n2) 解决方案
    func lengthOfLIS(_ nums: [Int]) -> Int {
      guard !nums.isEmpty else { return 0 }

      var dp: [Int] = Array(repeating: 1, count: nums.count)

      for i in 1..<nums.count {
        var maxCount = 0

        for j in 0..<i {
          if nums[i] > nums[j] {
            maxCount = max(maxCount, dp[j])
          }
        }
        dp[i] = maxCount + 1
      }
      return dp.max() ?? 0
    }
    
    // 此方法为 300 题的 O(n*logn) 解决方案
    func lengthOfLISBest(_ nums: [Int]) -> Int {
      guard !nums.isEmpty else { return 0 }

      // 35 题答案，二分法查找插入位置
      func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }

        var left = 0
        var right = nums.count - 1

        while left <= right {
          let index = (left + right) / 2
          if nums[index] == target {
            return index
          } else if nums[index] > target {
            right = index - 1
          } else {
            left = index + 1
          }
        }

        if right < 0 {
          return 0
        } else if left >= nums.count {
          return nums.count
        } else {
          return left
        }
      }

      var lis: [Int] = []
      for i in 0..<nums.count {
        let num = nums[i]

        if lis.isEmpty {
          lis.append(num)
          continue
        }

        if lis.last! < num {
          lis.append(num)
          continue
        }
        
        let replaceIndex = searchInsert(lis, num)
        lis[replaceIndex] = num
      }

      return lis.count
    }
    
    return lengthOfLISBest(heights.compactMap { $0 })
  }
}
