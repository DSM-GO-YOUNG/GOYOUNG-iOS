import SwiftUI

public extension View {
    func photoPicker(isPresented: Binding<Bool>, selection: Binding<[UIImage]>) -> some View {
        self.modifier(PhotoPickerModifier(isPresented: isPresented, selection: selection))
    }
    func photoPicker(isPresented: Binding<Bool>, selection: Binding<UIImage>) -> some View {
        self.modifier(PhotoPickerModifier(isPresented: isPresented, selection: selection))
    }
}
