//
//  ContentView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 10.10.21.
//

import SwiftUI

struct ContentView: View {
    let buttonSize = UIScreen.main.bounds.width / 6.0 + 20
    
    var body: some View {
        VStack {
            Spacer()
            Text("Wie waren meine Lektionen heute?")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            HStack {
                Image("pushbutton very good").resizable().aspectRatio(contentMode: .fill).frame(width: buttonSize, height: buttonSize)
                Image("pushbutton good").resizable().aspectRatio(contentMode: .fill).frame(width: buttonSize, height: buttonSize)
                Image("pushbutton ok").resizable().aspectRatio(contentMode: .fill).frame(width: buttonSize, height: buttonSize)
                Image("pushbutton bad").resizable().aspectRatio(contentMode: .fill).frame(width: buttonSize, height: buttonSize)
                Image("pushbutton very bad").resizable().aspectRatio(contentMode: .fill).frame(width: buttonSize, height: buttonSize)
            }
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .resizable()
                    .padding(30)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120.0, height: 120.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
