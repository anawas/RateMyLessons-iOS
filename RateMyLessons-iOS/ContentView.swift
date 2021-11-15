//
//  ContentView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 10.10.21.
//

import SwiftUI

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
    
    @StateObject var votingVM = VotingsViewModel()

    var body: some View {
        VStack {
            if showDummyView {
                EvaluationView(votingData: votingVM)
            } else {
                VotingView(votingData: votingVM)
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
        VotingView(votingData: VotingsViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
