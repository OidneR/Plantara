//
//  DeviceDetailPage.swift
//  macro
//
//  Created by Michelle Aurelia on 28/10/21.
//

import SwiftUI

struct DeviceDetailPage : View {
  var body: some View {
      DDPage()
  }
}

struct DeviceDetailPage_Previews:PreviewProvider {
  static var previews: some View {
    DeviceDetailPage()
  }
}

struct DDPage: View {
  var body: some View {
    NavigationView {
    VStack (alignment: .leading) {

      Image("biji")
        .frame(maxWidth: .infinity, maxHeight: 194)
        .background(Color("BackgroundCardPlant"))

      Text("Bayam Hijau")
        .font(.title)
        .fontWeight(.bold)
        .padding(.leading, 30)

      ScrollView {

        VStack (alignment: .leading){

          HStack {
            CircularProgressBar()
              .frame(width: 100, height: 100)
              .padding(.trailing, 10)


            VStack (alignment: .leading) {
              Text("Soil Moisture")
                .bold()
              Text("Ideal: 200RH")
              HStack {
                Image(systemName: "exclamationmark.circle")
                  .foregroundColor(Color.red)
                Text("Please keep watering your plant everyday")
                  .foregroundColor(Color.red)
              }

                .foregroundColor(Color.red)
            }

          }.padding(.top, 20)


          HStack {
            CircularProgressBar()
              .frame(width: 100, height: 100)
              .padding(.trailing, 10)

            VStack (alignment: .leading) {
              Text("Sunlight Meter")
                .bold()
              Text("Ideal: 1200Lx")
              HStack {
                Image(systemName: "exclamationmark.circle")
                  .foregroundColor(Color.red)
                Text("Your plant isn't in the right place")
                  .foregroundColor(Color.red)
              }
            }

          }.padding(.top, 20)


          HStack {
            CircularProgressBar()
              .frame(width: 100, height: 100)
              .padding(.trailing, 10)

            VStack (alignment: .leading) {
              Text("Temperature")
                .bold()
              Text("Ideal: 22C")
              HStack {
                Image(systemName: "exclamationmark.circle")
                  .foregroundColor(Color.red)
                Text("Please move your plant")
                  .foregroundColor(Color.red)
              }
            }
          }.padding(.top, 20)

          HStack {
            CircularProgressBar()
              .frame(width: 100, height: 100)
              .padding(.trailing, 10)

            VStack (alignment: .leading) {
              Text("Sunlight Meter")
                .bold()
              Text("Ideal: 1200Lx")
              HStack {
                Image(systemName: "exclamationmark.circle")
                  .foregroundColor(Color.red)
                Text("Your plant isn't in the right place")
                  .foregroundColor(Color.red)
              }

                .foregroundColor(Color.red)
            }

          }.padding(.top, 20)

        }.padding(.leading, 30)

      }


    }.navigationBarTitle("[Device Name]")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {

        ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarLeading) {
          Button (action: {print("Button has been pressed")}){
          Image(systemName: "chevron.left")
              .foregroundColor(Color("Brown"))
          Text("Back")
                .foregroundColor(Color("Brown"))
          }
        }

        ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
          Button (action: {print("Button has been pressed")}){
          Text("Settings")
              .foregroundColor(Color("Brown"))

          }
        }

      }

  }


  }
}
