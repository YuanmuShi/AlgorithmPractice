//
//  232-MyQueue.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/11.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

/*
 232. 用栈实现队列
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列的支持的所有操作（push、pop、peek、empty）：

 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false

 说明：

 你只能使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。

 进阶：

 你能否实现每个操作均摊时间复杂度为 O(1) 的队列？换句话说，执行 n 个操作的总时间复杂度为 O(n) ，即使其中一个操作可能花费较长时间。

 示例：

 输入：
 ["MyQueue", "push", "push", "peek", "pop", "empty"]
 [[], [1], [2], [], [], []]
 输出：
 [null, null, null, 1, 1, false]

 解释：
 MyQueue myQueue = new MyQueue();
 myQueue.push(1); // queue is: [1]
 myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
 myQueue.peek(); // return 1
 myQueue.pop(); // return 1, queue is [2]
 myQueue.empty(); // return false

 提示：

 1 <= x <= 9
 最多调用 100 次 push、pop、peek 和 empty
 假设所有操作都是有效的 （例如，一个空的队列不会调用 pop 或者 peek 操作）
 */

extension Solution {
  static func test232() {
    let q = MyQueue()
    q.push(1)
    q.push(2)
    print(q.peek())
    q.push(3)
    print(q.pop())
    print(q.pop())
    print(q.pop())
    print(q.empty())
  }
}

// 优化方案：因为 removeStack 存放的是队列的前 n 个点，addStack 存放的是队列的后 m 个点，因此，每次 push 时无需再将 removeStack 元素都放回 addStack，使得 push 的时间复杂度从 O(n) 降到了 O(1)
class MyQueue {
  var addStack = MyStack()
  var removeStack = MyStack()

  init() {}

  func push(_ x: Int) {
    addStack.push(x)
  }

  func pop() -> Int {
    if removeStack.empty() {
      while addStack.top() > 0 {
        removeStack.push(addStack.pop())
      }
    }
    return removeStack.pop()
  }

  func peek() -> Int {
    if removeStack.empty() {
      while addStack.top() > 0 {
        removeStack.push(addStack.pop())
      }
    }
    return removeStack.top()
  }

  func empty() -> Bool {
    return addStack.empty() && removeStack.empty()
  }
}

/*
 // 常规解法，push pop 以及 peek 都是O(n)时间复杂度
 class MyQueue {
   var addStack = MyStack()
   var removeStack = MyStack()

   /** Initialize your data structure here. */
   init() {}

   /** Push element x to the back of queue. */
   func push(_ x: Int) {
     while removeStack.top() > 0 {
       addStack.push(removeStack.pop())
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
     return removeStack.top()
   }

   /** Returns whether the queue is empty. */
   func empty() -> Bool {
     return addStack.empty() && removeStack.empty()
   }
 }
 */
