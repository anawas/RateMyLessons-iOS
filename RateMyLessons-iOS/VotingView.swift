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
    var body: some View {
        return VStack {
            Spacer()
            Text("Wie fanden Sie meine Lektionen heute?")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            HStack {
                VotingButton(verdict: "very good").tag(1)
                VotingButton(verdict: "good").tag(2)
                VotingButton(verdict: "ok").tag(3)
                VotingButton(verdict: "bad").tag(4)
                VotingButton(verdict: "very bad").tag(5)
            }
            Spacer()
        }
    }
}

struct VotingView_Previews: PreviewProvider {
    static var previews: some View {
        VotingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
