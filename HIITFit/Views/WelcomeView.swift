import SwiftUI

struct WelcomeView: View {
  @Binding var selectedTab:Int
  @State private var showHistory = false
    var body: some View {
      ZStack {
        VStack {
          HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
          Spacer()
          Button("History") {
            showHistory.toggle()
          }
          .sheet(isPresented: $showHistory) {
            HistoryView(showHistory: $showHistory)
          }
          .padding(.bottom)
        }
        VStack {
          HStack(alignment: .bottom) {
            VStack (alignment: .leading){
              Text("Get fit")
                .font(.largeTitle)
              Text("with high intensity interval training")
                .font(.headline)
            }
            Image("step-up")
//              .resizable()
//              .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//              .frame(width: 240.0, height: 240.0)
              .resizedToFill(width: 240, height: 240) //in the image extension in ImageExtension.swift
              .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          }
          Button( action: { selectedTab = 0 }) {
            Text("Get Started")
            Image(systemName: "arrow.right.circle")
          }
          .font(.title2)
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 20)
              .stroke(Color.gray, lineWidth: 2))
        }
      }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
      WelcomeView(selectedTab: .constant(9))
    }
}
