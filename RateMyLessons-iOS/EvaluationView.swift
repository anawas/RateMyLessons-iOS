//
//  EvaluationView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 12.11.21.
//

import SwiftUI

struct EvaluationView: View {
    @ObservedObject var votingData: VotingsViewModel

    init(votingData: VotingsViewModel) {
        UITableView.appearance().backgroundColor = .clear
        self.votingData = votingData
    }
    
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
                            .fontWeight(.semibold)
                        Spacer()
                        Text("\(vote.count)")
                            .font(.title)
                            .fontWeight(.semibold)
                            
                    }
                }
                HStack {
                    Text("Durchschnittliche Bewertung: ")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(String(format: "%.1f", self.votingData.averageRating))
                        .font(.title)
                        .fontWeight(.bold)
                }.padding([.top, .bottom, .trailing], 50)
                
            }.frame(width: 800.0, height: 700.0)
                .background(Color.white)

            Spacer()
            Button(action: {
                votingData.resetCounter()
            }, label: {
                Text("Zurücksetzen")
                    .font(.title)
            })
        }.onAppear(perform: {
            self.votingData.calculateAverage()
        })
    }
}


struct EvaluationView_Previews: PreviewProvider {
    @ObservedObject var votingData: VotingsViewModel
    static var previews: some View {
        EvaluationView(votingData: VotingsViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
