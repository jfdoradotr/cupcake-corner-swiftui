# Cupcake Corner

Cupcake Corner is Project 10 from Paul Hudson's **100 Days of SwiftUI** course. This project introduces concepts like data persistence with `UserDefaults`, networking with `URLSession`, and user input validation in SwiftUI apps.

## Features

- **Customizable Orders**: Users can select the type of cupcake, quantity, and special requests like extra frosting and sprinkles.
- **Delivery Details**: A form to input name, address, city, and zip code with validation to ensure complete information.
- **Networking**: Sends the order data to a server using `URLSession` and handles success or failure with appropriate user feedback.
- **Image Loading**: Displays an image from a remote URL with `AsyncImage`.
- **Cost Calculation**: Dynamically calculates the total cost based on user selections.

---

## File Overview

### `ContentView.swift`

- The main screen where users can:
  - Select a cupcake type.
  - Adjust the quantity.
  - Add special requests (extra frosting, sprinkles).
  - Navigate to the delivery details screen.
- Uses a `Form` for a structured layout and `NavigationStack` for navigation.

### `AddressView.swift`

- Displays a form for entering delivery details:
  - Name
  - Street address
  - City
  - Zip code
- Validates the input and disables the "Check out" button until the address is complete.

### `CheckoutView.swift`

- Final screen where:
  - Users review the total cost.
  - Place the order by interacting with a server API (`https://reqres.in/api/cupcakes`).
  - Displays success or failure alerts with appropriate messages.
- Uses `AsyncImage` to load a cupcake image and `ScrollView` for better user experience.

### `Order.swift`

- A model class implementing:
  - Codable for data encoding/decoding.
  - ObservableObject for SwiftUI state management.
  - Cost calculation logic.
  - Address validation logic.
  - Data persistence using `UserDefaults`.

---

## Learning Highlights

- **State Management**: Leveraging SwiftUI's `@State`, `@Bindable`, and `@Observable` for dynamic UI updates.
- **Data Persistence**: Storing and retrieving user input with `UserDefaults`.
- **Networking**: Using `URLSession` to send data to a server and handle responses.
- **Dynamic Alerts**: Displaying success or failure messages based on the network operation.
- **Custom UI Interactions**: Form-based input handling with `TextField`, `Picker`, `Stepper`, and `Toggle`.

---

## Challenges Solved

- **Validation**: Added logic to ensure the delivery address is valid before proceeding to checkout.
- **Error Handling**: Gracefully handled networking errors with alerts showing user-friendly messages.
- **Data Persistence**: Preserved user inputs across app launches using `UserDefaults`.

---

## Screenshots

| Demo                          |
| ----------------------------- |
| ![demo](screenshots/demo.gif) |