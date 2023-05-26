import SwiftUI

struct PhotoPickerModifier: ViewModifier {

    var isPresented: Binding<Bool>

    var singleSelection: Binding<UIImage>?
    var multipleSelection: Binding<[UIImage]>?

    @State var isErrorAlertPresented: Bool = false

    init(isPresented: Binding<Bool>, selection: Binding<UIImage>) {
        self.isPresented = isPresented
        self.singleSelection = selection
        self.multipleSelection = nil
    }

    init(isPresented: Binding<Bool>, selection: Binding<[UIImage]>) {
        self.isPresented = isPresented
        self.singleSelection = nil
        self.multipleSelection = selection
    }

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: self.isPresented) {
                if let singleSelection {
                    PhotoPicker(selection: singleSelection, isErrorAlertPresented: self.$isErrorAlertPresented)
                        .accentColor(.mainPink)
                        .foregroundColor(.red)
                        .tint(.green)
                } else if let multipleSelection {
                    PhotoPicker(selection: multipleSelection, isErrorAlertPresented: self.$isErrorAlertPresented)
                        .accentColor(.mainPink)
                }
            }
    }
}
