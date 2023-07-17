// 2018 KAKAO BLIND RECRUITMENT [1차] 다트 게임
// https://school.programmers.co.kr/learn/courses/30/lessons/17682

import Foundation

func solution(_ dartResult:String) -> Int {

    let numberList = dartResult.split(whereSeparator: {$0.isNumber == false}).map{Int($0)!}
    let letterList = dartResult.split(whereSeparator: {$0.isNumber})
    let sdtDictionary: [Character: Double] = ["S": 1, "D": 2, "T": 3]

    var stack: [Int] = []

    for i in 0...2 {
        var score = Double(numberList[i])
        for item in letterList[i] {
            if let num = sdtDictionary[item] {
                stack.append(Int(pow(score, num)))
                continue
            }
            let cur = stack.removeLast()
            if item == "*" {
                if let prev = stack.popLast() {
                    stack.append(prev * 2)
                }
                stack.append(cur * 2)
            } else {
                stack.append(cur * -1)
            }
        }
    }
    return stack.reduce(0) {$0 + $1}
}

print(solution("1S2D*3T"))  // 37
print(solution("1D2S#10S")) // 9
print(solution("1D2S0T"))   // 3
print(solution("1S*2T*3S")) // 23
print(solution("1D#2S*3S")) // 5
print(solution("1T2D3D#"))  // -4
print(solution("1D2S3T*"))  // 59
