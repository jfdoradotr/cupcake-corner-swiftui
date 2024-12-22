//
// Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI
import Observation

@Observable
class User: Codable {
  var name = "James"
}

struct ContentView: View {
  var body: some View {
    Button("Encode James", action: encodeJames)
  }

  func encodeJames() {
    let data = try! JSONEncoder().encode(User())
    let str = String(decoding: data, as: UTF8.self)
    print(str)
  }
}

#Preview {
  ContentView()
}
