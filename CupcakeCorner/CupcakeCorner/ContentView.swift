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
    Text("Hello")
  }
}

#Preview {
  ContentView()
}
