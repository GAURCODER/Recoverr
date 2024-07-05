# Recover

Recover is a Flutter mobile application designed to help users manage lost and found items. This project leverages a tech stack consisting of Dart for Flutter, C++ for performance-critical components, and Python for backend services and machine learning.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- **User Registration and Login**: The app offers secure user authentication and management, ensuring that only registered users can post or search for lost and found items. User data is securely stored, and authentication is managed using modern encryption standards to protect user information.

- **Lost and Found Listings**: Users can easily create posts for lost or found items by providing details such as item description, location, and basic information. These listings are categorized and can be browsed by other users, making it simple to search for or report items.

- **Search Functionality**: The advanced search functionality allows users to quickly find lost and found items using various filters such as item name and item description. This feature is designed to help users navigate through listings efficiently and find relevant items with ease.

- **Realtime Chat**: Users can communicate with each other in real-time through a built-in chat feature. This allows users to discuss details about lost and found items, coordinate meetups for item exchanges, or ask questions about listings directly within the app. The chat feature enhances user engagement and facilitates quicker resolution of lost and found cases.

- **Machine Learning**: The app integrates Python-based machine learning models to enhance the matching process for lost and found items. By analyzing item descriptions and images, the ML models can suggest potential matches, significantly improving the chances of finding lost items. This automated matching process saves users time and effort.

- **Cross-Platform**: Built with Flutter, the app supports both iOS and Android platforms, providing a seamless and consistent user experience across devices. This cross-platform compatibility ensures that a wider audience can access and benefit from the app, regardless of their device preference.


## Overview of the project

**Sign Up**
![sign up](https://github.com/Ankit-Ransh/Recover/assets/98517507/d3e0da90-96a0-4fa7-ba19-d085a155acc3)

**Login**
![login](https://github.com/Ankit-Ransh/Recover/assets/98517507/344a61e8-3bba-4571-b9d9-94fb656a881f)

**Home Page**
![home](https://github.com/Ankit-Ransh/Recover/assets/98517507/fbb8da71-1828-4973-b8ff-ddf19d7e12dd)

**Information Brochure**
![information](https://github.com/Ankit-Ransh/Recover/assets/98517507/94a25bec-3f98-4346-b7b3-49dce63a12ab)

**Report Item**
![report userflow](https://github.com/Ankit-Ransh/Recover/assets/98517507/e08b6ca3-00b3-494f-b239-e432c44dca42)

**Report Lost Items**
![lost page](https://github.com/Ankit-Ransh/Recover/assets/98517507/d836f048-d27f-4dda-9adf-d118d0c8e1a8)

**Report Found Items**
![found](https://github.com/Ankit-Ransh/Recover/assets/98517507/eeef2193-9dac-4917-9228-d6ef21b0ec63)

**Successfully Reported Status**
<img width="356" alt="found motivation" src="https://github.com/Ankit-Ransh/Recover/assets/98517507/ef949a9c-69c7-49ae-9d20-599f154afbdd">

**Last Reported Items**
<img width="356" alt="last reported" src="https://github.com/Ankit-Ransh/Recover/assets/98517507/202e1048-8303-4566-9ab4-7a7735128fb7">

**Browse Tab**
![browse item](https://github.com/Ankit-Ransh/Recover/assets/98517507/a20d2adc-0c43-4dde-aa57-0319ab6f90e7)

**My Items**
![personal item page](https://github.com/Ankit-Ransh/Recover/assets/98517507/9149777a-dece-4191-bfe7-c0ca75622704)

**Users List**
![message](https://github.com/Ankit-Ransh/Recover/assets/98517507/ffc90137-44cd-4058-acb0-2f21488292f1)

**Sample Chat**
<img width="355" alt="Screenshot 2024-05-16 at 5 57 24 PM" src="https://github.com/Ankit-Ransh/Recover/assets/98517507/8e01cb7e-1976-4a85-bfab-36ddd4e3ebc8">


## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Python
- **Performance**: C++

## Installation

To get a local copy up and running, follow these steps.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Python: [Install Python](https://www.python.org/downloads/)
- C++ Compiler: Ensure you have a C++ compiler installed (e.g., GCC, Clang, MSVC)

### Setup

1. Clone the repository ```git clone https://github.com/Ankit-Ransh/Recover.git ```
2. Open flutter repository ```cd Recover/lost_found ```
3. Install Flutter dependencies ``` flutter pub get ```
4. Set up the Python environment ``` pip install -r requirements.txt ``` 

### Usage

1. Run the Flutter application ``` flutter run ```
2. Ensure the backend services are running ``` python app.py ```

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
