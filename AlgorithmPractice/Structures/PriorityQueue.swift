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

class PriorityQueue<Element> where Element: Comparable {
  
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
  
  private func checkVailed(_ e: Element, index: Int) -> Bool {
    guard index < size() else {
      return false
    }
    
    switch priorityType {
    case .min:
      return store[index] < e
    case .max:
      return store[index] < e
    }
  }
  
  private func exchange(lh: Int, rh: Int) {
    guard max(lh, rh) < size() else { return }
    let tmp = store[lh]
    store[lh] = store[rh]
    store[rh] = tmp
  }
  
  // 向下堆化
  private func heapifyDown(with e: Element) {
    guard checkVailed(e, index: 0) else { return }
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
      
      guard checkVailed(store[currentIndex], index: exchangeIndex) else {
        return
      }
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
  func remove(_ e: Element) -> Bool {
    fatalError("Unimplemented")
  }
}
