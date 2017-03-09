import Foundation

/*:
 8.7 Write a method to compute all permutations of a string of unique characters. 
 */

extension String {
  
  func allPermutationsOfUniqueString() -> [String] {
    guard let last = characters.last else { return [""] }
    var permutations = ["\(last)"]
    characters.dropLast().reversed().forEach { c in
      var nextPermutations = [String]()
      permutations.forEach { permutation in
        permutation.characters.indices.forEach { i in
          var permutation = permutation
          permutation.insert(c, at: i)
          nextPermutations.append(permutation)
        }
        nextPermutations.append(permutation.appending("\(c)"))
      }
      permutations = nextPermutations
    }
    return permutations
  }
}

let s = "abcd"
s.allPermutationsOfUniqueString()
