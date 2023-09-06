import SwiftUI

struct SuccessView: View {
  @Binding var selectedTab: Int
  @Environment(\.dismiss) var dismiss
    var body: some View {
      ZStack {
        VStack {
          Image(systemName: "hand.raised.fill")
            .resizedToFill(width: 75, height: 75)
          .foregroundColor(Color.purple)
          Text("High Five!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.top)
          Text("""
              Good job completing all four exercises!
              Remember tomorrow's another day.
              So eat well and get some rest.
              """)
          .foregroundColor(Color.gray)
          .multilineTextAlignment(.center)
        }
        VStack {
          Spacer()
          Button("Continue") {
            selectedTab = 9
            dismiss()
          }
            .padding(.bottom)
        }
      }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
      SuccessView(selectedTab: .constant(3))
    }
}
