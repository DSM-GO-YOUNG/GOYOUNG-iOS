import SwiftUI

struct GFillButton: View {
    let title: String
    let action: () -> Void
    let backgroundColor: Color
    let textColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let cornerRadius: CGFloat

    init(
        title: String,
        action: @escaping () -> Void,
        backgroundColor: Color = .mainGreen,
        textColor: Color = .white,
        borderColor: Color = .clear,
        borderWidth: CGFloat = 0,
        cornerRadius: CGFloat = 50
    ) {
        self.title = title
        self.action = action
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.cornerRadius = cornerRadius
    }

    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(title)
                    .font(.suseongBatang(22))
                    .foregroundColor(textColor)
                Spacer()
            }
            .frame(height: 71)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
        }
    }
}

struct GFillButton_Previews: PreviewProvider {
    static var previews: some View {
        GFillButton(title: "로그인", action: { })
    }
}
