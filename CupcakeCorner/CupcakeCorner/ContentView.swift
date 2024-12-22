//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

@Observable
class Order {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

  var name = ""
  var streetAddress = ""
  var city = ""
  var zip = ""
  var type = 0
  var quantity = 3

  var specialRequestedEnabled = false {
    didSet {
      if specialRequestedEnabled == false {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
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

        Section {
          Toggle("Any special requests?", isOn: $order.specialRequestedEnabled)

          if order.specialRequestedEnabled {
            Toggle("Add extra frosting", isOn: $order.extraFrosting)
            Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
          }
        }

        Section {
          NavigationLink("Delivery details") {
            AddressView(order: order)
          }
        }
      }
      .navigationTitle("Cupcake Corner")
    }
  }
}

#Preview {
  ContentView()
}
