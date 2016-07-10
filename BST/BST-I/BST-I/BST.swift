//
//  BST.swift
//  BST-I
//
//  Created by Mars on 7/8/16.
//  Copyright © 2016 Boxue. All rights reserved.
//

import Foundation

public class TreeNode<T: Comparable> {
    public var value: T
    // parent, left, right is only writable inside TreeNode
    private(set) public var parent: TreeNode?
    private(set) public var left: TreeNode?
    private(set) public var right: TreeNode?
    
    // Initializers
    init(value: T,
         parent: TreeNode? = nil,
         left: TreeNode? = nil,
         right: TreeNode? = nil) {
        self.value  = value
        self.parent = parent
        self.left   = left
        self.right  = right
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var hasSingleLeftChild: Bool {
        return left != nil && right == nil
    }
    
    public var hasSingleRightChild: Bool {
        return left == nil && right != nil
    }
    
    public var hasAnyChild: Bool {
        return left != nil || right != nil
    }
    
    public var hasBothChildren: Bool {
        return left != nil && right != nil
    }
}

public class BST<T: Comparable> {
    private(set) public var root: TreeNode<T>?
    
    public init(value: T) {
        self.root = TreeNode<T>(value: value)
    }
    
    public init(arrayLiteral: [T]) {
        precondition(arrayLiteral.count > 0)
        
        self.root = TreeNode<T>(value: arrayLiteral[0])
        
        for value in arrayLiteral[ 1 ..< arrayLiteral.count ] {
            // Insert each value under root
            insert(value: value)
        }
    }
    
    public func insert(value: T) {
        insert(value: value, under: self.root!)
    }
}

// All helpers here
extension BST {
    private func insert(value: T, under parent: TreeNode<T>) {
        if value < parent.value {
            if let left = parent.left {
                insert(value: value, under: left)
            }
            else {
                let node = TreeNode<T>(value: value)
                parent.left = node
                node.parent = parent
            }
        }
        else if value > parent.value {
            if let right = parent.right {
                insert(value: value, under: right)
            }
            else {
                let node = TreeNode<T>(value: value)
                parent.right = node
                node.parent = parent
            }
        }
    }
}
