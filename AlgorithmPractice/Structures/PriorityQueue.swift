//
//  PriorityQueue.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2021/1/15.
//  Copyright © 2021 Jeffrey. All rights reserved.
//

import Foundation

enum PriorityType {
  case min
  case max
}

class MyPriorityQueue<Element> where Element: Comparable {
  private var store: [Element] = []
  private let priorityType: PriorityType
  private let capacity: UInt
  
  init(collection: [Element], capacity: UInt = 0, priorityType: PriorityType = .min) {
    self.priorityType = priorityType
    self.capacity = capacity
    
    collection.forEach { [weak self] e in
      self?.offer(e)
    }
  }
  
  func size() -> Int {
    return store.count
  }
  
  private func exchange(lh: Int, rh: Int) {
    guard max(lh, rh) < size() else { return }
    let tmp = store[lh]
    store[lh] = store[rh]
    store[rh] = tmp
  }
  
  func checkVailed(_ e: Element, index: Int = 0) -> Bool {
    guard index < size() else { return false }
    
    switch priorityType {
    case .min:
      return store[index] <= e
    case .max:
      return store[index] >= e
    }
  }
  
  // 向下堆化
  private func heapifyDown(with e: Element) {
    guard checkVailed(e) else { return }
    
    store[0] = e
    var currentIndex = 0
    
    while currentIndex < size(), (currentIndex * 2 + 1) < size() {
      let left = currentIndex * 2 + 1
      let right = currentIndex * 2 + 2
      var exchangeIndex = left
      
      if right < size() {
        switch priorityType {
        case .min:
          if store[right] < store[left] {
            exchangeIndex = right
          }
        case .max:
          if store[right] > store[left] {
            exchangeIndex = right
          }
        }
        exchangeIndex = right
      }
      
      guard checkVailed(store[currentIndex], index: exchangeIndex) else { return }
      exchange(lh: currentIndex, rh: exchangeIndex)
      currentIndex = exchangeIndex
    }
  }
  
  // 向上堆化
  private func heapifyUp(with e: Element) {
    store.append(e)
    
    var index = store.count - 1
    while index > 0 {
      let parentIndex = (index - 1) / 2
      switch priorityType {
      case .min:
        if store[parentIndex] <= store[index] {
          break
        }
        exchange(lh: index, rh: parentIndex)
      case .max:
        if store[parentIndex] >= store[index] {
          break
        }
        exchange(lh: index, rh: parentIndex)
      }
      
      index = parentIndex
    }
  }
  
  func offer(_ e: Element) {
    if size() < capacity {
      heapifyUp(with: e)
    } else {
      heapifyDown(with: e)
    }
  }
  
  @discardableResult
  func contain(_ e: Element) -> Bool {
    return store.contains(e)
  }
  
  func peek() -> Element? {
    return store.first
  }
  
  @discardableResult
  func poll() -> Element? {
    guard !store.isEmpty else { return nil }
    
    let e = store[0]
    if size() > 1 {
      heapifyDown(with: store.removeLast())
    } else {
      store.removeFirst()
    }
    return e
  }
}

private extension Int {
  var leftChild: Int {
    return (2 * self) + 1
  }
  
  var rightChild: Int {
    return (2 * self) + 2
  }
  
  var parent: Int {
    return (self - 1) / 2
  }
}

class PriorityQueue<Element: Comparable> {
  // 队列的存储。
  private var queue: [Element]
  
  // 当前队列的大小。
  public var size: Int {
    return queue.count
  }
  
  public init() {
    self.queue = [Element]()
  }
}

extension PriorityQueue {
  @discardableResult
  public func offer(_ item: Element) -> Bool {
    queue.append(item)
    heapifyUp(from: queue.count - 1)
    return true
  }
  
  public func poll() -> Element? {
    guard queue.count > 0 else {
      return nil
    }
    return popAndHeapifyDown()
  }
  
  public func peek() -> Element? {
    return queue.first
  }
  
  public func clear() {
    queue.removeAll()
  }
  
  // 弹出队列中的第一个元素，并通过将根元素移向队尾的方式恢复最小堆排序。
  private func popAndHeapifyDown() -> Element {
    let firstItem = queue[0]
    
    if queue.count == 1 {
      queue.remove(at: 0)
      return firstItem
    }
    
    queue[0] = queue.remove(at: queue.count - 1)
    heapifyDown()
    return firstItem
  }
  
  // 通过将元素移向队头的方式恢复最小堆排序 参数 index: 要移动的元素的索引值。
  private func heapifyUp(from index: Int) {
    var child = index
    var parent = child.parent
    
    while parent >= 0, queue[parent] > queue[child] {
      swap(parent, with: child)
      child = parent
      parent = child.parent
    }
  }
  
  /**
   通过将根元素移向队尾的方式恢复队列的最小堆排序。
   */
  private func heapifyDown() {
    var parent = 0
    
    while true {
      let leftChild = parent.leftChild
      if leftChild >= queue.count {
        break
      }
      
      let rightChild = parent.rightChild
      var minChild = leftChild
      if rightChild < queue.count, queue[minChild] > queue[rightChild] {
        minChild = rightChild
      }
      
      if queue[parent] > queue[minChild] {
        swap(parent, with: minChild)
        parent = minChild
      } else {
        break
      }
    }
  }
  
  /**
   交换存储中位于两处索引值位置的元素。
   - 参数 firstIndex：第一个要交换元素的索引。
   - 参数 secondIndex：第二个要交换元素的索引。
   */
  private func swap(_ firstIndex: Int, with secondIndex: Int) {
    let firstItem = queue[firstIndex]
    queue[firstIndex] = queue[secondIndex]
    queue[secondIndex] = firstItem
  }
}
