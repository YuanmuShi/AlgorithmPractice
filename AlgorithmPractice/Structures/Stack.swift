//
//  Stack.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/11.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

class MyStack {
  
  private var stack: [Int] = []
  
  /** Initialize your data structure here. */
  init() {
    
  }
  
  /** Push element x onto stack. */
  func push(_ x: Int) {
    stack.append(x)
  }
  
  /** Removes the element on top of the stack and returns that element. */
  func pop() -> Int {
    return stack.popLast() ?? 0
  }
  
  /** Get the top element. */
  func top() -> Int {
    return stack.last ?? 0
  }
  
  /** Returns whether the stack is empty. */
  func empty() -> Bool {
    return stack.isEmpty
  }
}
