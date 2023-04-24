import SwiftUI

private enum FocusedTextView {
    case textView
}
struct GTextView: View {
    let placeholder: String
    let text: Binding<String>

    init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self.text = text
        UITextView.appearance().backgroundColor = .clear
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: text)
                .padding(.top, 6)
                .padding(.leading, 12)
                .font(.suseongBatang(18))

            if text.wrappedValue.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(uiColor: .lightGray))
                    .font(.suseongBatang(18))
                    .padding(.top, 12)
                    .padding(.leading, 16)
            }
        }
        .background(Color.white)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.line, lineWidth: 1)
        }
    }
}

struct GTextView_Previews: PreviewProvider {
    static var previews: some View {
        GTextView(
            placeholder: "플레이스홀더",
            text: .constant("")
        )
    }
}
