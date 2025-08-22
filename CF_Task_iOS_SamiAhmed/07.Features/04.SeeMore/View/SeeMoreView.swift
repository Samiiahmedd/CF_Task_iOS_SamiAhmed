import SwiftUI

struct SeeMoreView: View {
    
    //MARK: - Propirites
    @ObservedObject var viewModel: SeeMoreViewModel
    
    // MARK: - Init
    init(viewModel: SeeMoreViewModel) {
        self.viewModel = viewModel
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                viewModel.showTerms = true
            }) {
                HStack {
                    Text("Terms & Conditions")
                        .foregroundColor(.appPrimary)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $viewModel.showTerms) {
            TermsView()
        }
    }
}
