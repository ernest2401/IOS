import Foundation
import UIKit

func squeeze(line: String) -> String {
    var str = line
    var count = 0
    var result = ""
    var massive = [Character]()
    
    for i in 0 ... str.count - 1{
        massive.append(str[str.startIndex])
        str.removeFirst()
    }

    for i in 0 ... massive.count - 1{
        if i != massive.count - 1{
            if massive[i] != massive[i+1]{
                result = result + String(massive[i]) + String(massive.filter{$0 == massive[i]}.count)
                count = 0
                }
        } else {
            result = result + String(massive[i]) + String(massive.filter{$0 == massive[i]}.count)
            count += 1
        }
    }
    guard (result.count <= massive.count) == true else { return line }
    return result
}

print(squeeze(line: "aaabb"))


