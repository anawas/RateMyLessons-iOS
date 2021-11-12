//
//  ContentView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 10.10.21.
//

import SwiftUI

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

class VotingsVewModel: ObservableObject {
    @Published var votings: [Vote] = [
        .init(verdict: "very good"),
        .init(verdict: "good"),
        .init(verdict: "ok"),
        .init(verdict: "bad"),
        .init(verdict: "very bad")]
    
    func increaseVote(verdict: String) -> Void {
        for vote in votings {
            if vote.verdict == verdict {
                print("Updating verdict: \(vote.verdict)")
                vote.count += 1
            }
        }
    }
    
    func countVotes() -> Int {
        var sum: Int = 0
        for vote in votings {
            sum += vote.count
        }
        return sum
    }
}


let translations: [String:String] = [
    "very good": "inspirierend",
    "good": "gut",
    "ok": "war OK",
    "bad": "uninteressant",
    "very bad": "schlecht"
]

struct ContentView: View {
    @State var timer: Timer?
    @State var numberOfClicks: Int = 0
    @State var showDummyView: Bool = false
    @State var icon: String = "chevron.right.circle"
 
    let evaluationView: some View = EvaluationView()
    let votingView: some View = VotingView()

    var body: some View {
        VStack {
            if showDummyView {
                evaluationView
            } else {
                votingView
            }
            Spacer()
            HStack{
                Spacer()
                Button {
                    timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                        numberOfClicks = 0}
                    numberOfClicks += 1
                    if numberOfClicks == 4 {
                        print("Switching to next view")
                        showDummyView.toggle()
                        if showDummyView {
                            icon = "chevron.left.circle"
                        } else {
                            icon = "chevron.right.circle"
                        }
                    }
                } label: {
                    Image(systemName: icon)
                        .resizable()
                        .padding(30)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120.0, height: 120.0)
                }
            }
        }
    }
}

struct NextViewButton: View {
    @State var numberOfClicks: Int = 0
    @State var timer: Timer?
    
    var body: some View {
        Button {
            timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
                numberOfClicks = 0}
            numberOfClicks += 1
            if numberOfClicks == 4 {
                print("Switching to next view")
            }
        } label: {
            Image(systemName: "chevron.right.circle")
                .resizable()
                .padding(30)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120.0, height: 120.0)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VotingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
