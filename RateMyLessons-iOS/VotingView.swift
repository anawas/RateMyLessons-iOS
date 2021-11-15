//
//  VotingView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 12.11.21.
//

import SwiftUI


// Glass like push buttons created with http://www.holshousersoftware.com/glass/
// Others by https://www.imagefu.com/create/badge

struct VotingView: View {
    @ObservedObject var votingData: VotingsViewModel
    
    var body: some View {
        return VStack {
            Spacer()
            Text("Wie fanden Sie meine Lektionen heute?")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            HStack {
                VotingButton(verdict: "very good", votingVM: votingData).tag(1)
                VotingButton(verdict: "good", votingVM: votingData).tag(2)
                VotingButton(verdict: "ok", votingVM: votingData).tag(3)
                VotingButton(verdict: "bad", votingVM: votingData).tag(4)
                VotingButton(verdict: "very bad", votingVM: votingData).tag(5)
            }
            Spacer()
        }
    }
}

/*
struct VotingView_Previews: PreviewProvider {
    static var previews: some View {
        VotingView(votingData: self.votingData)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
*/
