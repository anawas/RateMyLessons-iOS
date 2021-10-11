//
//  ContentView.swift
//  RateMyLessons-iOS
//
//  Created by Andreas Wassmer on 10.10.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Wie waren meine Lektionen heute?")
            Spacer()
            HStack {
                Text("Image 1")
                Text("Image 2")
                Text("Image 3")
                Text("Image 4")
                Text("Image 5")

            }
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "chevron.right.circle")
                    .padding(20)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50.0, height: 50.0)
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
