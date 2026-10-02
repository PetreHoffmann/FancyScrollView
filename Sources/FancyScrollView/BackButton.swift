import SwiftUI

struct BackButton: View {
    let color: Color

    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    
    @State private var hasBeenShownAtLeastOnce: Bool = false

    var body: some View {
        (presentationMode.wrappedValue.isPresented || hasBeenShownAtLeastOnce) ?
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
               Image(systemName: "chevron.left")
                   .resizable()
                   .aspectRatio(contentMode: .fit)
                   .frame(width: 10, height: 16)
                   .foregroundColor(color)
                   .font(Font.body.bold())
                   .padding(10)
                   .overlay(
                       Circle()
                           .stroke(Color.accentColor, lineWidth: 1.5)
                   )
                   .padding(.horizontal, 16)
            }
            .onAppear {
                self.hasBeenShownAtLeastOnce = true
            }
        : nil
    }
}
