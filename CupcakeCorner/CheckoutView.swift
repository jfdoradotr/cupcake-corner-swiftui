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
        Button("Place Order") {
          Task {
            await placeOrder()
          }
        }
        .padding()
      }
    }
    .navigationTitle("Check out")
    .navigationBarTitleDisplayMode(.inline)
    .scrollBounceBehavior(.basedOnSize)
  }

  func placeOrder() async {
    guard let encoded = try? JSONEncoder().encode(order) else {
      print("Failed to encode order")
      return
    }

    let url = URL(string: "https://reqres.in/api/cupcakes")!
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
  }
}

#Preview {
  NavigationStack {
    CheckoutView(order: Order())
  }
}
