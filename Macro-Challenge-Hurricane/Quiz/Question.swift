//
//  Question.swift
//  TheSign
//
//  Created by Antonio Emanuele Cutarella on 17/02/22.
//

import Foundation
import SwiftUI

struct Question: Hashable {
    let questionText: String
    let possibleAnswers: [String]
    let correctAnswerIndex: Int
    
    static let allQuestions: [Question] = [
        Question(questionText: NSLocalizedString("Question1", comment: ""),
                 possibleAnswers: [
                    NSLocalizedString("Answer1_1", comment: ""),
                    NSLocalizedString("Answer1_2", comment: ""),
                    NSLocalizedString("Answer1_3", comment: ""),
                    NSLocalizedString("Answer1_4", comment: ""),
                 ],
                 correctAnswerIndex: 0),
//        Question(questionText: NSLocalizedString("Question2", comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer2_1",comment: ""),
//                    NSLocalizedString("Answer2_2", comment: ""),
//                    NSLocalizedString("Answer2_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 0),
//        Question(questionText: NSLocalizedString("Question3", comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer3_1", comment: ""),
//                    NSLocalizedString("Answer3_2", comment: ""),
//                    NSLocalizedString("Answer3_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 2),
//        Question(questionText: NSLocalizedString("Question4",comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer4_1", comment: ""),
//                    NSLocalizedString("Answer4_2", comment: ""),
//                    NSLocalizedString("Answer4_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 0),
//        Question(questionText: NSLocalizedString("Question5",comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer5_1", comment: ""),
//                    NSLocalizedString("Answer5_2", comment: ""),
//                    NSLocalizedString("Answer5_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 0),
//        Question(questionText: NSLocalizedString("Question6",comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer6_1", comment: ""),
//                    NSLocalizedString("Answer6_2", comment: ""),
//                    NSLocalizedString("Answer6_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 2),
//        Question(questionText: NSLocalizedString("Question7",comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer7_1", comment: ""),
//                    NSLocalizedString("Answer7_2", comment: ""),
//                    NSLocalizedString("Answer7_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 2),
//        Question(questionText: NSLocalizedString("Question8",comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer8_1", comment: ""),
//                    NSLocalizedString("Answer8_2", comment: ""),
//                    NSLocalizedString("Answer8_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 1),
//        Question(questionText: NSLocalizedString("Question9",comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer9_1", comment: ""),
//                    NSLocalizedString("Answer9_2", comment: ""),
//                    NSLocalizedString("Answer9_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 0),
//        Question(questionText: NSLocalizedString("Question10",comment: ""),
//                 possibleAnswers: [
//                    NSLocalizedString("Answer10_1", comment: ""),
//                    NSLocalizedString("Answer10_2", comment: ""),
//                    NSLocalizedString("Answer10_3", comment: ""),
//                 ],
//                 correctAnswerIndex: 1),
    ]
}
