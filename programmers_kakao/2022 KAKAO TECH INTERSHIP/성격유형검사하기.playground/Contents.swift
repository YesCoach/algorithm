import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var surveyResultDic: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    var result: String = ""

    for index in 0..<choices.count {
        let score = choices[index] - 4

        let first = survey[index].first!
        let last = survey[index].last!

        if score < 0 {
            surveyResultDic[first]! += abs(score)
        } else if score > 0 {
            surveyResultDic[last]! += score
        }
    }

    surveyResultDic["R"]! >= surveyResultDic["T"]! ? result.append("R") : result.append("T")
    surveyResultDic["C"]! >= surveyResultDic["F"]! ? result.append("C") : result.append("F")
    surveyResultDic["J"]! >= surveyResultDic["M"]! ? result.append("J") : result.append("M")
    surveyResultDic["A"]! >= surveyResultDic["N"]! ? result.append("A") : result.append("N")

    return result
}

solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]) // "TCMA"
solution(["TR", "RT", "TR"], [7, 1, 3]) // "RCJA"
