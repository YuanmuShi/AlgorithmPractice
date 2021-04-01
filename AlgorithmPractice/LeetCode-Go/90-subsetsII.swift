//
//  90-subsetsII.swift
//  AlgorithmPractice
//
//  Created by guojie shi on 2021/3/31.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation
/*
 90. 子集 II
 给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。

 解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。

 示例 1：
 输入：nums = [1,2,2]
 输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]

 示例 2：
 输入：nums = [0]
 输出：[[],[0]]

 提示：

 1 <= nums.length <= 10
 -10 <= nums[i] <= 10

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/subsets-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

extension Solution {
  static func test90() {
    print(subsetsWithDup([1, 2, 2]))
  }

  private static func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    let sortedNums = nums.sorted()

    func backtrack(start: Int, track: inout [Int]) {
      res.append(track)
      for index in start ..< sortedNums.count {
        if index > start, sortedNums[index] == sortedNums[index - 1] {
          continue
        }
        track.append(sortedNums[index])
        backtrack(start: index + 1, track: &track)
        track.removeLast()
      }
    }

    var items = [Int]()
    backtrack(start: 0, track: &items)

    return res
  }
}
