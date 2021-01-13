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
    let kthLargest = KthLargest(3, [5, -1])
    print(kthLargest.add(2))
    print(kthLargest.add(1))
    print(kthLargest.add(-1))
    print(kthLargest.add(3))
    print(kthLargest.add(4))
  }
}

class KthLargest {
  
  private var nums: [Int] = []
  
  private let k: Int
  private var kthLargestNums: [Int] = []

  init(_ k: Int, _ nums: [Int]) {
    self.k = k
    
    nums.forEach { [weak self] num in
      self?.add(num)
    }
  }
  
  @discardableResult
  func add(_ val: Int) -> Int {
    func sortKthNums() {
      guard kthLargestNums.count > 1 else { return }
      let maxIndex = kthLargestNums.count - 1
      for i in 0..<maxIndex {
        let num = kthLargestNums[maxIndex - i]
        let pre = kthLargestNums[maxIndex - i - 1]
        
        if pre >= num { break }
        kthLargestNums[maxIndex - i - 1] = num
        kthLargestNums[maxIndex - i] = pre
      }
    }
    
    if kthLargestNums.count < k {
      kthLargestNums.append(val)
      sortKthNums()
      return kthLargestNums.last ?? 0
    }
    
    guard let lastNum = kthLargestNums.last else { return 0 }
    
    if lastNum > val {
      return lastNum
    }
    kthLargestNums.removeLast()
    kthLargestNums.append(val)
    sortKthNums()
    return kthLargestNums.last ?? 0
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
