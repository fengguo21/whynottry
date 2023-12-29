//
//  ContentView.swift
//  WhyNotTry
//
//  Created by 任亚坤 on 2023/12/27.
//

import SwiftUI
import Combine


struct ContentView: View {

  var activities = [
    "Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing",
    "Golf", "Hiking", "Lacrosse", "Rugby", "Squash",
  ]
  var colors: [Color] = [
    .blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red,
  ]

  @State var selectedColor = Color.white
  @State private var selected = "Archery"
  @State private var id = 1
  @State private var isOn = false
  @State private var rating = 0.5



    

  var body: some View {
    VStack {
      Text("Why not try…")
        .font(.largeTitle.bold())

      VStack {

        Circle().fill(.blue)
          .padding()
          .overlay(
            Image(systemName: "figure.\(selected.lowercased())").font(.system(size: 144))
              .foregroundColor(self.selectedColor)
          )
        Text("\(selected)!")
          .font(.title)

      }.transition(.slide).id(id)
      Spacer()
      Toggle(isOn: $isOn) {
        Text("State: \(self.isOn == true ? "开":"关")")
      }.padding(20)

      Slider(value: $rating)

      

      Button("Try again") {
        withAnimation(.easeInOut(duration: 1)) {
          selected = activities.randomElement() ?? "Archery"
          selectedColor = colors.randomElement() ?? .blue
          id += 1
          print("Hello, world23424!")
          // change activity
          // change color
        }

      }
      .buttonStyle(.borderedProminent)

    }
    .padding()
  }
}

#Preview {
  ContentView()
}
