# Smath (Simple mathematics)

A simple calculator project, this is a ION Mobility Test project. This project is developed within 7 Days given time, the main objective of this project is :

- Simple logic, + (addition) , - (subtraction), * (multiplication), and / (division).
- with Bloc (with Cubit) as a state-management solution.
- can design your own UI, or copy the UI from either iOS or Android’s system calculator apps.

Therefore for the judging Criteria will be based on :
- Correctness
- Code Quality & Readability

Not forget to mention there is also a bonus points on this project that can be achieved :
- Unit Tests
- Widget Tests
- Code Comments
- ReadMe.md
- Custom App Icon
- Creative App Name
- App's UI/UX
- Additional features as you see fit

# Depedencies
This project use multiple dependency, for state management this project using `flutter_bloc` with Cubit approach. For the math evaluation this project use `math_expressions` so this project can be more focus to manage the interface and states. Other than that for User interface and staggered grid I use `flutter_staggered_grid_view` to make it more beautiful. Also there is supporting dependency such as `intl` for number formatting and `google_fonts` for more beautiful UI.
- flutter_bloc: ^8.1.6
- google_fonts: ^6.2.0
- flutter_staggered_grid_view: ^0.7.0
- intl: ^0.19.0
- math_expressions: ^2.5.0

## Getting Started

1. Clone this repository
2. Make sure to match the SDK first `Flutter version 3.22.2` and `Dart version 3.4.3`
3. Run command `git fetch`
4. Checkout to `main` branch
5. Run command `git pull` or `git reset --hard origin/main` to reset current head to origin/main
6. Run `flutter pub get` from root directory
7. Run `flutter run` 


## Features
- (A very Basic) Calculator
- It has 2 theme modes, light and dark

<table>
  
  <tr>
    <th>
      Light Mode
    </th>
    <th>
      Dark Mode
    </th>
    <th>
      Custom App Icon (Android)
    </th>
  </tr>
  <tr>
    <td>
        <img src="https://github.com/dwikurniantom/calculator/assets/27884014/2ead6aa5-8957-4bea-9d4a-ee269ea3a7ff" width="250px">
    </td>
    <td>
        <img src="https://github.com/dwikurniantom/calculator/assets/27884014/91e9e0a8-0523-455c-93a8-20ad1b541b0b" width="250px">
    </td>
    <td>
        <img src="https://github.com/dwikurniantom/calculator/assets/27884014/2aa8ffd6-e8c1-415c-a78c-446073731a9a" width="250px">
    </td>
  </tr>
</table>

## Tips
> If there is something off with the UI this project is mainly developed using Iphone 15 pro max simulator, and this project might or may be support other screensize / screen category.
