//
//  VotingButton.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 12.11.21.
//

import SwiftUI
import AVFoundation

let systemSoundID: SystemSoundID = 1104  // System sound Tock

struct VotingButton: View {
    let buttonSize = UIScreen.main.bounds.width / 6.0 + 20
    let verdict: String
    
    @ObservedObject var votingVM: VotingsViewModel

    var body: some View {
        Button {
            AudioServicesPlaySystemSound(systemSoundID)
            votingVM.increaseVote(verdict: self.verdict)
        } label: {
            ZStack {
                Image("pushbutton " + self.verdict)
                .resizable().aspectRatio(contentMode: .fill)
                .frame(width: buttonSize, height: buttonSize)
                .rotationEffect(.degrees(-20.0))
                Text("\(translations[self.verdict]!)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
        }
    }
}

/*
struct VotingButton_Previews: PreviewProvider {
    static var previews: some View {
        VotingButton(verdict: "very good")
    }
}
*/
