import SwiftUI

struct ConfirmationView: View {
    let viewModel: ProductComparisonViewModel
    let onConfirm: () -> Void
    let onCancel: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(spacing: DSSpacing.medium) {
                    HStack {
                        Spacer()
                        Button(action: onCancel) {
                            Image(systemName: "xmark")
                                .font(.body.weight(.semibold))
                                .foregroundStyle(Color(uiColor: DSColor.textPrimary))
                                .frame(width: 44, height: 44)
                                .background(Color(uiColor: DSColor.backgroundSecondary), in: Circle())
                        }
                        .accessibilityLabel("Fechar confirmação")
                    }

                    Image(systemName: "checkmark")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(Color(uiColor: DSColor.statusSuccess))
                        .frame(width: 80, height: 80)
                        .background(Color(uiColor: DSColor.surfaceSuccess), in: Circle())
                        .accessibilityHidden(true)

                    Text("Confirmar substituição?")
                        .font(.title2.weight(.bold))
                        .foregroundStyle(Color(uiColor: DSColor.textPrimary))
                        .multilineTextAlignment(.center)
                        .accessibilityAddTraits(.isHeader)
                        .accessibilityIdentifier("substitution-confirmation-title")

                    Text("Vamos substituir o item indisponível pelo produto abaixo.")
                        .font(.body)
                        .foregroundStyle(Color(uiColor: DSColor.textSecondary))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)

                    productCard(viewModel.original, heading: "Item original", isSubstitute: false)

                    Image(systemName: "arrow.down")
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(Color(uiColor: DSColor.textPrimary))
                        .accessibilityLabel("Será substituído por")

                    productCard(viewModel.substitute, heading: "Substituir por", isSubstitute: true)
                }
                .padding(.horizontal, DSSpacing.medium)
                .padding(.top, DSSpacing.large)
                .padding(.bottom, DSSpacing.medium)
                .frame(maxWidth: .infinity)
            }
            actionBar
        }
        .background(Color(uiColor: DSColor.backgroundPrimary))
    }

    private var actionBar: some View {
        VStack(spacing: DSSpacing.small) {
            Button(action: onConfirm) {
                Text("Confirmar substituição")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 52)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(uiColor: DSColor.interactivePrimary))
            .accessibilityIdentifier("confirmation-confirm")
            .accessibilityHint("Atualiza o pedido demonstrativo com o produto escolhido.")

            Button("Cancelar", action: onCancel)
                .font(.body.weight(.semibold))
                .foregroundStyle(Color(uiColor: DSColor.brandPrimary))
                .frame(maxWidth: .infinity, minHeight: 44)
        }
        .padding(.horizontal, DSSpacing.medium)
        .padding(.top, DSSpacing.small)
        .padding(.bottom, DSSpacing.xxSmall)
        .background(Color(uiColor: DSColor.backgroundPrimary))
    }

    private func productCard(
        _ item: ProductComparisonViewModel.Item,
        heading: String,
        isSubstitute: Bool
    ) -> some View {
        HStack(alignment: .top, spacing: DSSpacing.medium) {
            Image(systemName: "shippingbox")
                .font(.system(size: 36))
                .foregroundStyle(Color(uiColor: DSColor.brandPrimary))
                .frame(width: 68, height: 76)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: DSSpacing.xxSmall) {
                Text(heading)
                    .font(.subheadline)
                    .foregroundStyle(Color(uiColor: isSubstitute ? DSColor.statusSuccess : DSColor.textSecondary))
                Text(item.name)
                    .font(.headline)
                    .foregroundStyle(Color(uiColor: DSColor.textPrimary))
                    .fixedSize(horizontal: false, vertical: true)
                Text("\(item.quantity) · \(item.brand)")
                    .font(.body)
                    .foregroundStyle(Color(uiColor: DSColor.textSecondary))
                    .fixedSize(horizontal: false, vertical: true)
                Text(item.price)
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(Color(uiColor: DSColor.textPrimary))
            }
            Spacer(minLength: 0)
        }
        .padding(DSSpacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color(uiColor: isSubstitute ? DSColor.surfaceSuccess : DSColor.surfacePrimary),
            in: RoundedRectangle(cornerRadius: DSRadius.large)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(heading): \(item.name), \(item.quantity), \(item.brand), preço \(item.price)")
    }
}
