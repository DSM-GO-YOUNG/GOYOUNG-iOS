import SwiftUI

struct WriteJobOfferView: View {

    @StateObject var viewModel = WriteJobOfferViewModel()

    var body: some View {
        VStack(spacing: 12) {
            ScrollView {
                GTextField(placeholder: "제목", text: $viewModel.title)
                GTextField(placeholder: "근무일 (주@일)", text: $viewModel.workDay)
                GTextField(placeholder: "출근시간 (예: 09:00)", text: $viewModel.startTime)
                GTextField(placeholder: "퇴근시간 (예: 18:00)", text: $viewModel.endTime)
                GTextView(placeholder: "주요업무", text: $viewModel.work)
                    .frame(height: 180)
                GTextView(placeholder: "복지", text: $viewModel.welfare)
                    .frame(height: 180)
                GTextView(placeholder: "자격요건", text: $viewModel.condition)
                    .frame(height: 180)
                GTextView(placeholder: "우대사항", text: $viewModel.prefer)
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
