import SwiftUI

struct WriteJobOfferView: View {
    var body: some View {
        VStack(spacing: 12) {
            ScrollView {
                GTextField(placeholder: "제목", text: .constant(""))
                GTextField(placeholder: "근무일 (주@일)", text: .constant(""))
                GTextField(placeholder: "근무시간", text: .constant(""))
                GTextView(placeholder: "주요업무", text: .constant(""))
                    .frame(height: 180)
                GTextView(placeholder: "복지", text: .constant(""))
                    .frame(height: 180)
                GTextView(placeholder: "자격요건", text: .constant(""))
                    .frame(height: 180)
                GTextView(placeholder: "우대사항", text: .constant(""))
                    .frame(height: 180)
            }
            GFillButton(title: "등록하기", action: { })
        }
        .padding(.horizontal, 16)
        .navigationTitle("모집 작성")
        .navigationBarTitleDisplayMode(.inline)
        .setNavigationBackButton()
        .navigationBarBackButtonHidden()
    }
}

struct WriteJobOfferView_Previews: PreviewProvider {
    static var previews: some View {
        WriteJobOfferView()
    }
}
