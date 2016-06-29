//: Playground - noun: a place where people can play

import UIKit

// [1, 5, 6]

/*
 [1] is ordered
 
 [1, 5]
  <--> swap
 [5, 1]
 
 [5, 1, 6]
     ^ 6 > 1 == true
 [5, 1, 6]
     <--> swap
 [5, 6, 1]
  ^ 6 > 5 == true
 [5, 6, 1]
  <--> swap
 [6, 5, 1]
 */

//: [SE-0048](https://github.com/apple/swift-evolution/blob/master/proposals/0048-generic-typealias.md)
typealias Criteria<T> = (T, T) -> Bool

//: [SE-0023 API设计指南](https://github.com/Boxue/swift-api-design-guidelines/blob/master/SE-0023%20swift-api-guidelines.md)
//: [SE-0046](https://github.com/apple/swift-evolution/blob/master/proposals/0046-first-label.md)
func insertionSortOf<T: Comparable>(_ coll: Array<T>, byCriteria: Criteria<T> = { $0 < $1 }) -> Array<T> {
    // 1. An array with a single element is ordered
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    
    for x in 1 ..< coll.count {
        var y = x
        var key = result[y]
        
        print("Get: \(key)")
        
        // 2. If the key needs to swap in the ordered sub array
        while y > 0 && byCriteria(key, result[y - 1]) {
            print("-----------------------------")
            print("Remove \(key) at pos: \(y)")
            print("Insert \(key) at pos: \(y - 1)")
            print("-----------------------------")
            
            // 3. Swap the value
            result.remove(at: y) // remove(at:) replaces removeAtIndex
            result.insert(key, at: y - 1) // insert(_:at:) replaces insert(_:atIndexPath:)
//            swap(&result[y - 1], &result[y])
            
            y -= 1
        }
    }
    
    return result
}

let a: Array<Int> = [1, 5, 6]
insertionSortOf(a)
insertionSortOf(a, byCriteria: >)

/*
 [5, 1, 6]
        ^ --> remember 6
 [5, 1, 1]
     --> shift 1 right
 [5, 5, 1]
  --> shift 5 right
 [6, 5, 1]
  ^ --> copy 6 here
 */
