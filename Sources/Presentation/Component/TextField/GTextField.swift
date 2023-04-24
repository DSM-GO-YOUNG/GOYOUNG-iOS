import SwiftUI

struct GTextField: View {
    let placeholder: String
    let text: Binding<String>

    var body: some View {
        TextField(placeholder, text: text)
            .padding(.leading, 22)
            .padding(.vertical, 16)
            .background(Color.white)
            .cornerRadius(50)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.line, lineWidth: 1)
            }
    }
}

struct GTextField_Previews: PreviewProvider {
    static var previews: some View {
        GTextField(placeholder: "ㅎㅇㅎㅇ", text: .constant("!!"))
    }
}
