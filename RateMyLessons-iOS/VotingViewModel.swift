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
    var ranking: Int
    
    init(verdict: String, ranking: Int) {
        self.verdict = verdict
        self.count = 0
        self.ranking = ranking
    }
    
    func getVerdict() -> String {
        return self.verdict
    }
}

class VotingsViewModel: ObservableObject {
    @Published var votesCounter = 0
    @Published var averageRating:Float = 0.0
    @Published var votings: [Vote] = []
        
    init() {
        self.votings.append(Vote(verdict: "very good", ranking: 5))
        self.votings.append(Vote(verdict: "good", ranking: 4))
        self.votings.append(Vote(verdict: "ok", ranking: 3))
        self.votings.append(Vote(verdict: "bad", ranking: 2))
        self.votings.append(Vote(verdict: "very bad", ranking: 1))
    }
    
    func increaseVote(verdict: String) -> Void {
        for vote in votings {
            if vote.verdict == verdict {
                vote.count += 1
                //print("Updating verdict: \(vote.verdict)")
                //print("New count       : \(vote.count)")
            }
        }
        self.countVotes()
    }
    
    func countVotes() -> Void {
        self.votesCounter = 0
        for vote in votings {
            self.votesCounter += vote.count
        }
        //print("Total votes: \(self.votesCounter)")
    }
    
    func calculateAverage() -> Void {
        var sum = 0
        for vote in votings {
            sum += vote.ranking*vote.count
        }
        if self.votesCounter == 0 {
            self.averageRating = 0.0
        } else {
            self.averageRating = Float(sum)/Float(self.votesCounter)
        }
    }
    
    func resetCounter() -> Void {
        self.votesCounter = 0
        for vote in votings {
            vote.count = 0
        }
        self.averageRating = 0.0
    }
}
