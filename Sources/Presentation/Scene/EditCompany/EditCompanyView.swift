import SwiftUI

struct EditCompanyView: View {

    @StateObject var viewModel = EditCompanyViewModel()
    @State var photoPickerIsPresented: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ImageView(imageUrl: viewModel.imageUrl, uiimage: $viewModel.image)
                    .padding(.top, 10)
                    .onTapGesture {
                        self.photoPickerIsPresented = true
                    }
                GTextField(placeholder: "회사명", text: $viewModel.name)
                GTextField(placeholder: "회사 종류", text: $viewModel.kind)
                GTextField(placeholder: "회사 위치", text: $viewModel.address)
                GTextView(placeholder: "상세 설명", text: $viewModel.content)
                    .frame(height: 223)
                GFillButton(title: "등록하기", action: { })
            }
            .photoPicker(
                isPresented: $photoPickerIsPresented,
                selection: $viewModel.image
            )
            .onChange(of: viewModel.isSuccess, perform: { success in
                if success {
                    dismiss()
                }
            })
            .padding(.horizontal, 16)
            .navigationTitle("회사 등록")
            .navigationBarTitleDisplayMode(.inline)
            .setNavigationBackButton()
            .navigationBarBackButtonHidden()
        }
    }
}

struct EditCompanyView_Previews: PreviewProvider {
    static var previews: some View {
        EditCompanyView()
    }
}
