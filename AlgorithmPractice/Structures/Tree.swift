//
//  Tree.swift
//  AlgorithmPractice
//
//  Created by Jeffrey on 2020/7/20.
//  Copyright © 2020 Jeffrey. All rights reserved.
//

import Foundation

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  
  public init() {
    self.val = 0
    self.left = nil
    self.right = nil
  }
  
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
  
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

public class Tree {}

extension Tree {
  static func createByRecursion(array: [Int?], index: Int = 1) -> TreeNode? {
    guard !array.isEmpty else { return nil }
    guard index - 1 < array.count else { return nil }
    guard let value = array[index - 1] else { return nil }
    
    let node = TreeNode(value)
    node.left = createByRecursion(array: array, index: 2 * index)
    node.right = createByRecursion(array: array, index: 2 * index + 1)
    
    return node
  }
  
  static func create(tree: [Int?]) -> TreeNode? {
    guard !tree.isEmpty else { return nil }
    
    guard let value = tree.first, value != nil else { return nil }
    
    let nodes = tree.map { v -> TreeNode? in
      guard let v = v else { return nil }
      let node = TreeNode(v)
      return node
    }
    
    var i = 0
    while 2 * i + 2 < nodes.count {
      guard let current = nodes[i] else {
        i += 1
        continue
      }
      
      if 2 * i + 1 < nodes.count, let left = nodes[2 * i + 1] {
        current.left = left
      }
      
      if 2 * i + 2 < nodes.count, let right = nodes[2 * i + 2] {
        current.right = right
      }
      i += 1
    }
    
    return nodes.first ?? nil
  }
}
