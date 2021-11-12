//
//  ContentView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 10.10.21.
//

import SwiftUI
import AVFoundation

let systemSoundID: SystemSoundID = 1104  // System sound Tock
var votings: [String:Int32] = ["very good": 0,
                               "good": 0,
                               "ok": 0,
                               "bad": 0,
                               "very bad": 0]

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

struct VotingButton: View {
    let buttonSize = UIScreen.main.bounds.width / 6.0 + 20
    let verdict: String
    
    var body: some View {
        Button {
            print("Button \(verdict) pressed")
            AudioServicesPlaySystemSound(systemSoundID)
            var count = votings[verdict]
            count = count!+1
            votings[verdict] = count
        } label: {
            ZStack {
            Image("pushbutton " + verdict)
                .resizable().aspectRatio(contentMode: .fill)
                .frame(width: buttonSize, height: buttonSize)
                .rotationEffect(.degrees(-20.0))
            Text("\(translations[verdict]!)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VotingView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
