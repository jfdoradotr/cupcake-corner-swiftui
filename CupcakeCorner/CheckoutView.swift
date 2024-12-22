//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
  var order: Order

  var body: some View {
    ScrollView {
      VStack {
        AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
          image
            .resizable()
            .scaledToFit()
        } placeholder: {
          ProgressView()
        }
        Text("Your total is \(order.cost, format: .currency(code: "USD"))")
          .font(.title)
        Button("Place Order", action: { })
          .padding()
      }
    }
    .navigationTitle("Check out")
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationStack {
    CheckoutView(order: Order())
  }
}
