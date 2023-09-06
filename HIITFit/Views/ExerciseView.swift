import SwiftUI
import AVKit

struct ExerciseView: View {
  @EnvironmentObject var history: HistoryStore
  @Binding var selectedTab: Int
  @State private var rating = 0
  @State private var showHistory = false
  @State private var showSuccess = false
  let index: Int
  var exercise: Exercise {
    Exercise.exercises[index]
  }
  var lastExercise:Bool {
    index + 1 == Exercise.exercises.count
  }
  @State private var timerDone = false
  @State private var showTimer = false
  var startButton: some View {
    Button("Start Exercise"){
      showTimer.toggle()
    }
  }
  var doneButton: some View {
    Button("Done") {
      history.addDoneExercise(Exercise.exercises[index].exerciseName)
      timerDone = false
      showTimer.toggle()
      if lastExercise {
        showSuccess.toggle()
      } else {
        selectedTab += 1
      }
    }
  }
  var body: some View {
    GeometryReader { geometry in
      VStack(spacing:0) {
        HeaderView(selectedTab: $selectedTab, titleText: Exercise.exercises[index].exerciseName)
          .padding(.bottom)
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geometry.size.height * 0.45)
        HStack(spacing: 150) {
          startButton
          doneButton
            .disabled(!timerDone)
            .sheet(isPresented: $showSuccess) {
              SuccessView(selectedTab: $selectedTab)
                .presentationDetents([.medium, .large])
            }
        }
        .font(.title3)
        .padding()
        if showTimer {
          TimerView(timerDone: $timerDone, size: geometry.size.height * 0.07)
        }
        Spacer()
        RatingView(rating: $rating)
          .padding()
        Button("History") {
          showHistory.toggle()
        }
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
          .padding(.bottom)
      }
    }
  }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
      ExerciseView(selectedTab: .constant(0), index: 0)
        .environmentObject(HistoryStore())
    }
}
