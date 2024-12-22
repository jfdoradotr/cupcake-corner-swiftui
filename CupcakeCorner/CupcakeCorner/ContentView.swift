//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

@Observable
class Order {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

  var type = 0
  var quantity = 3

  var specialRequestedEnabled = false
  var extraFrosting = false
  var addSprinkles = false
}

struct ContentView: View {
  @State private var order = Order()

  var body: some View {
    NavigationStack {
      Form {
        Section {
          Picker("Select you cake type", selection: $order.type) {
            ForEach(Order.types.indices, id: \.self) {
              Text(Order.types[$0])
            }
          }

          Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
        }
      }
      .navigationTitle("Cupcake Corner")
    }
  }
}

#Preview {
  ContentView()
}
