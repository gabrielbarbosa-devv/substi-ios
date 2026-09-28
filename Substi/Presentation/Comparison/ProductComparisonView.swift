import SwiftUI

struct ProductComparisonView: View {
    let viewModel: ProductComparisonViewModel
    let imageLoader: ProductImageLoader
    let onChooseAnother: () -> Void
    let onConfirmSubstitute: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: DSSpacing.large) {
                    HStack(alignment: .top, spacing: DSSpacing.small) {
                        productCard(viewModel.original, title: "Original", isSubstitute: false)
                        productCard(viewModel.substitute, title: "Substituto", isSubstitute: true)
                    }

                    VStack(spacing: 0) {
                        ForEach(Array(viewModel.rows.enumerated()), id: \.element.id) { index, row in
                            comparisonRow(row)
                            if index < viewModel.rows.count - 1 {
                                Divider()
                                    .overlay(Color(uiColor: DSColor.borderDefault))
                            }
                        }
                    }
                    .padding(.horizontal, DSSpacing.medium)
                    .background(Color(uiColor: DSColor.surfacePrimary))
                    .clipShape(RoundedRectangle(cornerRadius: DSRadius.large))
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("Atributos para comparação")

                    Text("Compare as informações disponíveis antes de escolher.")
                        .font(.footnote)
                        .foregroundStyle(Color(uiColor: DSColor.textSecondary))
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityAddTraits(.isStaticText)

                    Text("Fotos do catálogo: Open Food Facts · CC BY-SA 3.0")
                        .font(.caption)
                        .foregroundStyle(Color(uiColor: DSColor.textSecondary))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, DSSpacing.medium)
                .padding(.top, DSSpacing.medium)
                .padding(.bottom, DSSpacing.large)
            }
            actionBar
        }
        .background(Color(uiColor: DSColor.backgroundPrimary))
        .navigationTitle("Comparar produtos")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var actionBar: some View {
        VStack(spacing: DSSpacing.small) {
            Button(action: onConfirmSubstitute) {
                Text("Escolher este substituto")
                    .font(.headline)
                    .frame(maxWidth: .infinity, minHeight: 52)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(uiColor: DSColor.interactivePrimary))
            .accessibilityIdentifier("comparison-choose-substitute")
            .accessibilityHint("Revise o resumo antes de confirmar a substituição.")

            Button("Ver outras opções", action: onChooseAnother)
                .font(.body.weight(.semibold))
                .foregroundStyle(Color(uiColor: DSColor.brandPrimary))
                .frame(minHeight: 44)
        }
        .padding(.horizontal, DSSpacing.medium)
        .padding(.top, DSSpacing.small)
        .padding(.bottom, DSSpacing.xxSmall)
        .background(Color(uiColor: DSColor.backgroundPrimary))
    }

    private func productCard(
        _ item: ProductComparisonViewModel.Item,
        title: String,
        isSubstitute: Bool
    ) -> some View {
        VStack(spacing: DSSpacing.small) {
            Text(title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(Color(uiColor: isSubstitute ? DSColor.statusSuccess : DSColor.textPrimary))
                .padding(.horizontal, DSSpacing.small)
                .padding(.vertical, DSSpacing.xxSmall)
                .background(Color(uiColor: isSubstitute ? DSColor.surfaceSuccess : DSColor.surfaceInformation))
                .clipShape(RoundedRectangle(cornerRadius: DSRadius.medium))

            ProductImageView(
                imageURL: item.imageURL,
                fallbackSymbolName: item.imageSymbolName,
                imageLoader: imageLoader
            )
            .frame(maxWidth: .infinity, minHeight: 76)

            Text(item.name)
                .font(.headline)
                .foregroundStyle(Color(uiColor: DSColor.textPrimary))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            Text(item.brand)
                .font(.subheadline)
                .foregroundStyle(Color(uiColor: DSColor.textSecondary))
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity)
        .padding(DSSpacing.small)
        .background(Color(uiColor: DSColor.surfacePrimary))
        .clipShape(RoundedRectangle(cornerRadius: DSRadius.large))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title): \(item.name), marca \(item.brand)")
    }

    private func comparisonRow(_ row: ProductComparisonViewModel.Row) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.xSmall) {
            Text(row.title)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(Color(uiColor: DSColor.textSecondary))

            HStack(alignment: .top, spacing: DSSpacing.small) {
                comparisonValue(row.originalValue, label: "Original")
                comparisonValue(row.substituteValue, label: "Substituto")
            }
        }
        .padding(.vertical, DSSpacing.small)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(row.title). Original: \(row.originalValue). Substituto: \(row.substituteValue).")
    }

    private func comparisonValue(_ value: String, label: String) -> some View {
        VStack(alignment: .leading, spacing: DSSpacing.xxSmall) {
            Text(label)
                .font(.caption)
                .foregroundStyle(Color(uiColor: DSColor.textSecondary))
            Text(value)
                .font(.body)
                .foregroundStyle(Color(uiColor: DSColor.textPrimary))
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
