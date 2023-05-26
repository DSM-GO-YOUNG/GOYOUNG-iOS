import SwiftUI

struct GTextField: View {
    let placeholder: String
    let text: Binding<String>
    let isDisabled: Bool

    init(
        placeholder: String = "",
        text: Binding<String>,
        isDisabled: Bool = false
    ) {
        self.placeholder = placeholder
        self.text = text
        self.isDisabled = isDisabled
    }

    var body: some View {
        TextField(placeholder, text: text)
            .disabled(isDisabled)
            .padding(.leading, 22)
            .padding(.vertical, 16)
            .background(Color.white)
            .cornerRadius(50)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(isDisabled ? Color.mainGreen : .line, lineWidth: 1)
            }
    }
}

struct GTextField_Previews: PreviewProvider {
    static var previews: some View {
        GTextField(placeholder: "ㅎㅇㅎㅇ", text: .constant("!!"))
    }
}
