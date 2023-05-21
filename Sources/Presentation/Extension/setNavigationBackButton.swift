import SwiftUI


struct NavigationBackButton: ViewModifier {
    @Environment(\.presentationMode) var presentationMode
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20))
                            .tint(.gray)
                    }
                }
            }
    }
}

extension View {
    func setNavigationBackButton() -> some View {
        self.modifier(NavigationBackButton())
    }
}
