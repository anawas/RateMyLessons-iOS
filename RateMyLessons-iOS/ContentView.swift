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


    let dummyView: some View = DummyView().view
    let votingView: some View = VotingView().view

    var body: some View {
        VStack {
            if showDummyView {
                dummyView
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

struct DummyView {
    var view: some View {
        return VStack {
            Spacer()
            Text("This is a dummy view")
            Spacer()
        }
    }
}


// Glass like push buttons created with http://www.holshousersoftware.com/glass/
// Others by https://www.imagefu.com/create/badge
struct VotingView {
    var view: some View {
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
        VotingView().view
            .previewInterfaceOrientation(.landscapeRight)
    }
}
