import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    var result: [String] = []
    for i in 0..<n {
        var str = String(arr1[i] | arr2[i], radix: 2)
        while str.count < n {
            str = "0" + str
        }
        result.append(str)
    }

    result.forEach {
        var temp: String = ""
        for i in $0 {
            if i == "1" {
                temp += "#"
            } else {
                temp += " "
            }
        }
        answer.append(temp)
    }

    return answer
}

// 비트 연산 활용한 풀이
func solution1(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        var str = String(arr1[i] | arr2[i], radix: 2)
        while str.count < n {
            str = "0" + str
        }
        answer.append(str)
    }

    return answer.map {$0.replacingOccurrences(of: "1", with: "#")}
    .map {$0.replacingOccurrences(of: "0", with: " ")}
}
