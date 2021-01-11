//
//  232-MyQueue.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/11.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

class MyQueue {
  
  var addStack = MyStack()
  var removeStack = MyStack()
  
  /** Initialize your data structure here. */
  init() {
    
  }
  
  /** Push element x to the back of queue. */
  func push(_ x: Int) {
    while addStack.top() > 0 {
      removeStack.push(addStack.pop())
    }
    addStack.push(x)
  }
  
  /** Removes the element from in front of queue and returns that element. */
  func pop() -> Int {
    while addStack.top() > 0 {
      removeStack.push(addStack.pop())
    }
    return removeStack.pop()
  }
  
  /** Get the front element. */
  func peek() -> Int {
    while addStack.top() > 0 {
      removeStack.push(addStack.pop())
    }
    return removeStack.pop()
  }
  
  /** Returns whether the queue is empty. */
  func empty() -> Bool {
    return addStack.empty() && removeStack.empty()
  }
}
