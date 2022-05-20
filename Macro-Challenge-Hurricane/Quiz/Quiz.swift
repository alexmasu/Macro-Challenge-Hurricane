//
//  Quiz.swift
//  TheSign
//
//  Created by Antonio Emanuele Cutarella on 17/02/22.
//

import SwiftUI

struct Quiz: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text(NSLocalizedString("Question", comment: "") + viewModel.progressText)
                    .padding()
                Spacer()
                Text(viewModel.questionText)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
                Spacer()
                VStack {
                    ForEach(viewModel.answerIndices, id: \.self) { index in
                        AnswerButton(text: viewModel.answerText(for: index)) {
                            viewModel.makeSelectionForCurrentQuestion(at: index)
                        }
                        .background(viewModel.colorForButton(at: index))
                        .padding()
                        .disabled(viewModel.selectionWasMade)
                    }
                }
                if viewModel.selectionWasMade {
                    Button(action: viewModel.advanceGameState,
                           label: {
                        BottomText(str: NSLocalizedString("QuizNextQuestion", comment: ""))
                    })
                }
            }.padding(.bottom)
        }
        .navigationBarHidden(false)
        .background(resultsNavigationLink)
    }
    
    private var resultsNavigationLink: some View {
        NavigationLink(
            destination: ResultsView(viewModel: ResultsViewModel(selectionCount: viewModel.selectionCount, gameStartTime: viewModel.gameStartTime, gameEndTime: Date())),
            isActive: .constant(viewModel.gameIsOver),
            label: { EmptyView() })
    }
}

struct AnswerButton: View {
    @StateObject var viewModel = GameViewModel()
    let text: String
    let onClick: () -> Void
    var body: some View {
        Button(action: {
            onClick()
        }) {
            Text(text)
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .leading)
                .padding()
                .lineLimit(6)
                .foregroundColor(.black)
                .border((Color(red:112/255, green: 49/255, blue: 127/255)),width: 4)
        }
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Quiz()
        }
    }
}
