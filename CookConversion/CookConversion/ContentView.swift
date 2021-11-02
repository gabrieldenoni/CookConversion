//
//  ContentView.swift
//  CookConversion
//
//  Created by Gabriel on 11/1/21.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(spacing: 0) {
      TopSelectionSection()
      ConversionResponses()
      UserInputSection()
    }
    .ignoresSafeArea()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

struct TopSelectionSection: View {
  var body: some View {
    ZStack {
      Rectangle()
        .foregroundColor(Color.skyBlue)
      VStack {
        HStack(alignment: .bottom, spacing: 15) {
          TapDownButton(measurementType: .preciseMeasure)
          TapDownButton(measurementType: .easyMeasure)
        }
        .frame(height: 60)
        .padding(.top, 60)
        .padding(30)
      }
      .frame(maxHeight: .infinity)
    }
    .ignoresSafeArea()
    .frame(maxWidth: .infinity)
    .frame(height: 120)
    .zIndex(1)
  }
}

struct ConversionResponses: View {
  var body: some View {
    ZStack {
      VStack(spacing: 0) {
        ZStack {
          Color.skyBlue
          Rectangle()
            .foregroundColor(Color.lightGray)
            .cornerRadius(25, corners: [.topLeft, .topRight])
        }
        .frame(height: 40)
        Rectangle()
          .foregroundColor(Color.lightGray)
      }
      ScrollView(showsIndicators: false) {
        VStack(spacing: 15) {
          TextBalloon(horizontalAlignment: .trailing, topLabel: "Grams", text: "120g")
          TextBalloon(horizontalAlignment: .leading, topLabel: "Tablespoon", text: "5tbsp")
        }
        // The scroll view is reversed, the views need to be reversed again so they don't get upside down
        .rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
        .padding(.vertical, 30)
      }
      .padding(.horizontal, 10)
      // To reverse the scroll view
      .rotationEffect(Angle(degrees: 180)).scaleEffect(x: -1.0, y: 1.0, anchor: .center)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(.top, 30)
  }
}

struct UserInputSection: View {
  @State private var textInput: String = ""

  var body: some View {
    ZStack {
      VStack(spacing: 0) {
        ZStack {
          Color.lightGray
          Rectangle()
            .foregroundColor(Color.white)
            .cornerRadius(25, corners: [.topLeft, .topRight])
        }
        .frame(height: 40)
        Rectangle()
          .foregroundColor(.white)
      }
      Rectangle()
        .cornerRadius(25, corners: [.topLeft, .topRight])
      VStack {
        ConversionTextField(textInput: $textInput, placeholderText: "Type the measure here...")
        Spacer()
      }
      .padding(30)
    }
    .frame(height: 200)
    .frame(maxWidth: .infinity)
    .ignoresSafeArea()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
