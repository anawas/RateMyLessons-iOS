//
//  EvaluationView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 12.11.21.
//

import SwiftUI

struct EvaluationView: View {
    @ObservedObject var votingData: VotingsViewModel

    var body: some View {
        return VStack {
            Spacer()
            Text("Abgegebene Stimmen: \(votingData.votesCounter)")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            List {
                ForEach(self.votingData.votings) { vote in
                    HStack {
                        Text(vote.verdict)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("\(vote.count)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }
                }
            }.padding(100)
            Spacer()
            Button(action: {
                votingData.resetCounter()
            }, label: {
                Text("Zurücksetzen")
                    .font(.title)
            })
        }
    }
}


struct EvaluationView_Previews: PreviewProvider {
    @ObservedObject var votingData: VotingsViewModel
    static var previews: some View {
        EvaluationView(votingData: VotingsViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
