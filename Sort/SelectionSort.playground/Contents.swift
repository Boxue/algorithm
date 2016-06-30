//: Playground - noun: a place where people can play

import UIKit

/*
 Sort [1, 5, 7, 6] in desc order
 
 [ | 1, 5, 7, 6]
     *<--->*
 [ | 7, 5, 1, 6]
   ^-->
 [ 7, | 5, 1, 6]
        *<--->*
 [ 7, | 6, 1, 5]
      ^-->
 [ 7, 6, | 1, 5]
           *  *
 [ 7, 6, | 5, 1]
         ^-->
 [ 7, 6, 5, | 1]
 */

typealias Criteria<T> = (T, T) -> Bool

func SelectionSortOf<T: Comparable>(_ coll: Array<T>,
                     byCriteria: Criteria<T> = { $0 > $1 }) -> Array<T> {
    guard coll.count > 1 else { return coll }
    
    var result = coll
    
    // TODO: add implementation here
    for x in 0 ..< coll.count - 1 {
        var candidateIndex = x
        
        print("------------------------")
        print("Sorted:\t\(result[0 ..< candidateIndex])")
        print("UnSorted:\t\(result[candidateIndex ..< result.count])")
        
        for y in x + 1 ..< coll.count {
            if byCriteria(result[candidateIndex], result[y]) {
                candidateIndex = y
            }
        }
        
        print(">>> Move \(result[candidateIndex]) into sorted portion")
        if (candidateIndex != x) {
            swap(&result[candidateIndex], &result[x])
        }
    }
    
    return result
}

let a = [1, 5, 7, 6]
SelectionSortOf(a, byCriteria: <)











