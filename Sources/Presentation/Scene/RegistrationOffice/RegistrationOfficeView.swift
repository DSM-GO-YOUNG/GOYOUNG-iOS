import SwiftUI

struct RegistrationOfficeView: View {
    @State var name: String = ""
    @State var type: String = ""
    @State var position: String = ""
    @State var content: String = ""

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(spacing: 22) {
                    Image.logo
                        .padding(.top, 30)
                    GTextField(placeholder: "회사명", text: $name)
                    GTextField(placeholder: "회사 종류", text: $type)
                    GTextField(placeholder: "회사 위치", text: $position)
                    GTextView(placeholder: "설명", text: $content)
                        .frame(minHeight: 300)
                }
            }
            GFillButton(title: "등록하기") {
            }
        }
        .padding(.horizontal, 16)
    }
}

struct RegistrationOfficeView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationOfficeView()
    }
}
