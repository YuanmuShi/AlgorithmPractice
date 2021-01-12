//
//  703-KthLargest.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/12.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test703() {
    let kthLargest = KthLargest(3, [4, 5, 8, 2])
    print(kthLargest.add2(3))
    print(kthLargest.add2(5))
    print(kthLargest.add2(10))
    print(kthLargest.add2(9))
    print(kthLargest.add2(4))
  }
}

class KthLargest {
  private var nums: [Int]
  private let k: Int

  init(_ k: Int, _ nums: [Int]) {
    self.k = k
    self.nums = nums.sorted(by: { $0 > $1 })
  }

  func add2(_ val: Int) -> Int {
    /// 超时
    nums.append(val)
    nums = nums.sorted(by: { $0 > $1 })
    return nums[k - 1]
  }

  func add3(_ val: Int) -> Int {
    /// 超时
    nums.append(val)
    let totalCount = nums.count

    for i in 1 ..< totalCount {
      let tmp = nums[totalCount - i - 1]
      if val > tmp {
        nums[totalCount - i] = tmp
        nums[totalCount - i - 1] = val
      } else {
        return nums[k - 1]
      }
    }

    return nums[k - 1]
  }
}
