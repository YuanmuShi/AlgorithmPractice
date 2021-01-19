//
//  50-PowxN.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/19.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

extension Solution {
  static func test50() {
    print(myPow(2, 3))
//    print(myPow1(8.84372, -5))
  }
  
  // 循环法
  private static func myPow(_ x: Double, _ n: Int) -> Double {
    var tmpX = x
    var tmpN = n
    
    if n < 0 {
      tmpX = 1 / x
      tmpN = -n
    }
    
    var result: Double = 1
    var power = tmpX
    
    while tmpN > 0 {
      if tmpN % 2 == 1 {
        result *= power
      }
      
      power *= power
      tmpN /= 2
    }
    
    return result
  }
  
  // 递归法
  private static func myPow1(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
      return 1
    }
    
    if n < 0 {
      return 1 / myPow(x, -n)
    }
    
    if n % 2 == 0 {
      return myPow(x * x, n / 2)
    }
    
    return x * myPow(x * x, n / 2)
  }
}
