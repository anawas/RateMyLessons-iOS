//
//  VotingViewModel.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 14.11.21.
//

import Foundation

class Vote: Identifiable {
    
    let id = UUID()
    var verdict: String
    var count: Int
    
    init(verdict: String) {
        self.verdict = verdict
        self.count = 0
    }
    
    func getVerdict() -> String {
        return self.verdict
    }
}

class VotingsViewModel: ObservableObject {
    @Published var votesCounter = 0
    @Published var votings: [Vote] = []
        
    init() {
        self.votings.append(Vote(verdict: "very good"))
        self.votings.append(Vote(verdict: "good"))
        self.votings.append(Vote(verdict: "ok"))
        self.votings.append(Vote(verdict: "bad"))
        self.votings.append(Vote(verdict: "very bad"))
    }
    
    func increaseVote(verdict: String) -> Void {
        for vote in votings {
            if vote.verdict == verdict {
                vote.count += 1
                print("Updating verdict: \(vote.verdict)")
                print("New count       : \(vote.count)")
            }
        }
        self.countVotes()
    }
    
    func countVotes() -> Void {
        self.votesCounter = 0
        for vote in votings {
            self.votesCounter += vote.count
        }
        print("Total votes: \(self.votesCounter)")
    }
}
