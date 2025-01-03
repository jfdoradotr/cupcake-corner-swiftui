//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

@Observable
class Order: Codable {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

  private let defaults = UserDefaults.standard

  var name: String {
    didSet {
      UserDefaults.standard.set(name, forKey: "name")
    }
  }
  var streetAddress: String {
    didSet {
      UserDefaults.standard.set(streetAddress, forKey: "streetAddress")
    }
  }
  var city: String {
    didSet {
      UserDefaults.standard.set(city, forKey: "city")
    }
  }
  var zip: String {
    didSet {
      UserDefaults.standard.set(zip, forKey: "zip")
    }
  }
  var type = 0
  var quantity = 3

  var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  var extraFrosting = false
  var addSprinkles = false

  var hasValidAddress: Bool {
    let name = name.trimmingCharacters(in: .whitespacesAndNewlines)
    let streetAddress = streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
    let city = city.trimmingCharacters(in: .whitespacesAndNewlines)
    let zip = zip.trimmingCharacters(in: .whitespacesAndNewlines)
    if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
      return false
    }
    return true
  }

  var cost: Decimal {
    // $2 per cake
    var cost = Decimal(quantity) * 2

    // complicated cakes cost more
    cost += Decimal(type) / 2

    // $1/cake for extra frosting
    if extraFrosting {
      cost += Decimal(quantity)
    }

    // $0.50/cake for sprinkles
    if addSprinkles {
      cost += Decimal(quantity) / 2
    }

    return cost
  }

  enum CodingKeys: String, CodingKey {
    case _type = "type"
    case _quantity = "quantity"
    case _specialRequestEnabled = "specialRequestEnabled"
    case _extraFrosting = "extraFrosting"
    case _addSprinkles = "addSprinkles"
    case _name = "name"
    case _city = "city"
    case _streetAddress = "streetAddress"
    case _zip = "zip"
  }

  init() {
    name = UserDefaults.standard.string(forKey: "name") ?? ""
    city = UserDefaults.standard.string(forKey: "city") ?? ""
    streetAddress = UserDefaults.standard.string(forKey: "streetAddress") ?? ""
    zip = UserDefaults.standard.string(forKey: "zip") ?? ""
  }
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
          Toggle("Any special requests?", isOn: $order.specialRequestEnabled)

          if order.specialRequestEnabled {
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
