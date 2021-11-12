//
//  EvaluationView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 12.11.21.
//

import SwiftUI

struct EvaluationView: View {
    @ObservedObject var votingVM = VotingsVewModel()

    var body: some View {
        return VStack {
            Spacer()
            Text("Abgegebene Stimmen: \(votingVM.countVotes())")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            ForEach(votingVM.votings) { vote in
                Text("\(vote.verdict): \(vote.count)")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Spacer()
        }
    }
}

struct EvaluationView_Previews: PreviewProvider {
    static var previews: some View {
        EvaluationView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
