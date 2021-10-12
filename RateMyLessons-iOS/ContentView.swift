//
//  ContentView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 10.10.21.
//

import SwiftUI

struct ContentView: View {
    let dummyView: some View = DummyView().view
    let votingView: some View = VotingView().view
    @State var timer: Timer?
    @State var numberOfClicks: Int = 0
    @State var showDummyView: Bool = false
    @State var icon: String = "chevron.right.circle"
    
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
        return Text("This is a dummy view")
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
}


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
        } label: {
            Image("pushbutton " + verdict)
                .resizable().aspectRatio(contentMode: .fill)
                .frame(width: buttonSize, height: buttonSize)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
