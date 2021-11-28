//
//  Onboarding.swift
//  
//
//  Created by Michelle Aurelia on 24/11/21.
//

import SwiftUI

struct Onboarding_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingContent()
  }
}

/*
 Button("Next"){
   Text("page 1")
 }.padding(.top, 60)
   .font(.custom("Lato", size: 20))
   .foregroundColor(Color("SecondaryColor"))
 */

struct OnboardingContent: View {
  @State var onboardingIndex = 1
  @State var bool: Bool = false
  @State var buttonText = "Next"

  init() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .brown
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.brown
  }
  var body: some View {
    NavigationView {
      VStack {
        TabView (selection: $onboardingIndex){
          OnboardingView(onboardImage: "OnboardingOne", onboardTitle: "Berkomunikasi dengan tanaman", onboardDesc: "Satu alat dapat menghubungkan anda dengan tanaman ada dengan mudah").tag(1)

          OnboardingView(onboardImage: "OnboardingTwo", onboardTitle: "Merawat tanpa khawatir", onboardDesc: "Dengan aplikasi Plantara, Anda dapat mengetahui kebutuhan apa saja yang tanaman Anda butuhkan.").tag(2)

          OnboardingView(onboardImage: "OnboardingThree", onboardTitle: "Selalu mendapatkan notifikasi", onboardDesc: "Aplikasi Plantara akan memberitahu Anda jika tanaman Anda berada dalam kondisi tertentu").tag(3)

          OnboardingView(onboardImage: "OnboardingFour", onboardTitle: "Tips & Triks", onboardDesc: "Menjaga tanaman Anda sehat selalu dengan tips dan triks yang disediakan oleh Plantara").tag(4)

          OnboardingView(onboardImage: "OnboardingFive", onboardTitle: "Mulai", onboardDesc: "Apa kebutuhan tanaman Anda? Bagaimana cara memenuhi kebutuhan tersebut? Daparkan semua jawabannya bersama PLANTARA!").tag(5)
        }
        .padding(.horizontal, 10)
        .accentColor(Color("SecondaryColor"))
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))


        Button(){
          onboardingIndex += 1
          if (onboardingIndex == 5) {
            bool = true
            buttonText = "Mulai"
          }
          else {
            bool = false
            buttonText = "Next"
          }
        }
      label: {
        Text(buttonText).font(.custom("Lato", size: 20))
      }
        .frame(width: 350, height: 60)
        .background(bool ? Color("SecondaryColor") : Color.white)
        .cornerRadius(13)
        .foregroundColor(bool ? Color.white : Color("SecondaryColor"))
        .padding(.bottom, 10)
      }


      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Lewati"){
            print("Lewati")
          }
          .foregroundColor(Color("SecondaryColor"))
        }
      }
    }
  }
}



struct OnboardingView: View {

  let onboardImage: String
  let onboardTitle: String
  let onboardDesc: String

  var body: some View {
      VStack {
        Image(onboardImage)
          .resizable()
          .frame(width: 300, height: 300)

        VStack (alignment: .leading){
          Text(onboardTitle)
            .font(.custom("Lato", size: 24))
            .fontWeight(.semibold)
            .padding(.bottom, 3)

          Text(onboardDesc)
            .font(.custom("Lato", size: 20))
        }
    }
  }
}

