## Getting Started

This project is a starting point for a Flutter application. The app follows a modular architecture pattern, allowing for better organization of code and easier maintenance and scalability. It separates concerns into different layers such as presentation, domain, and data layers, facilitating a clear separation of responsibilities.

The presentation layer consists of UI components, including widgets, screens, and navigation logic. It's responsible for rendering the user interface and handling user interactions.

The domain layer contains business logic and use cases, defining the core functionality of the app independently of any specific UI framework. It encapsulates the app's business rules and domain models, promoting code reusability and testability.

The data layer handles data retrieval and manipulation, interacting with external data sources such as databases, APIs, or local storage. In this project, the backend is built on Supabase, a powerful platform that provides authentication, real-time database, and file storage services out of the box.

## Folder Architecture

|-- data <br/>
&nbsp; &nbsp; &nbsp;  |-- datasources <br/>
&nbsp; &nbsp; &nbsp;  |-- models <br/>
&nbsp; &nbsp; &nbsp;  |-- repository <br/>
|-- domain <br/>
&nbsp; &nbsp; &nbsp;  |-- entities <br/>
&nbsp; &nbsp; &nbsp;  |-- repository <br/>
&nbsp; &nbsp; &nbsp;  |-- usecases <br/>
|-- presentation <br/>
&nbsp; &nbsp; &nbsp;  |-- bloc <br/>
&nbsp; &nbsp; &nbsp;  |-- pages <br/>
&nbsp; &nbsp; &nbsp;  |-- widgets <br/>

## Architecture
<img width="742" alt="Screenshot 2024-05-01 at 1 52 57 PM" src="https://github.com/Ankit-Ransh/Recover/assets/98517507/bf8833b8-855c-44c5-9c12-1ed2c9d9ff7c">

## Database Schema
<img width="821" alt="Screenshot 2024-05-01 at 8 12 36 PM" src="https://github.com/Ankit-Ransh/Recover/assets/98517507/6d3e7a4f-997e-481c-a36f-0464b9086354">

## Setting Up Supabase Backend

To set up the backend using Supabase for your Flutter project, follow these steps:

1. **Create a Supabase Account**: If you haven't already, sign up for a Supabase account at [Supabase.io](https://supabase.io/).

2. **Create a New Project**: Once logged in to your Supabase account, create a new project. This will give you access to your project's URL and API keys.

3. **Set Up Database**: Within your Supabase project, navigate to the "Database" tab and create a new database. Define your database schema, including tables for managing lost and found items.

4. **Access API Keys**: Go to the "Settings" tab in your Supabase project to access your API keys. You'll need these keys to authenticate requests to your Supabase backend from your Flutter app.

5. **Integrate Supabase SDK**: In your Flutter project, add the Supabase Dart SDK as a dependency. Find the latest version and installation instructions on the [Supabase Dart SDK GitHub page](https://github.com/supabase/supabase-dart).

6. **Initialize Supabase Client**: Initialize the Supabase client in your Flutter app using your Supabase project URL and API keys. This will allow your app to communicate with the Supabase backend.

7. **Implement Backend Logic**: Use the Supabase SDK to implement backend logic in your Flutter app, such as CRUD operations for managing lost and found items. Utilize Supabase's authentication, database, and storage features for user authentication, data storage, and file uploads.

8. **Test and Deploy**: Test your app to ensure that the backend integration is working correctly. Once satisfied, deploy your Flutter app with the Supabase backend to production.

## Create a secrets folder
  Folder location ``` lib/core/secrets ```
  Create a file ``` lib/core/secrets/supabase_secrets.dart ```
  ```
    class SupaBaseSecrets {
      static const url = "";
      static const anonKey = "";
    }
  ```


## State Management with BLoC

In this project, we utilize the BLoC (Business Logic Component) pattern for managing state in the presentation layer of our Flutter app. BLoC is a design pattern that separates business logic from UI components, allowing for better scalability, testability, and maintainability of the codebase.

### What is BLoC?

BLoC stands for Business Logic Component and is a design pattern introduced by Google that helps manage the state of a Flutter application in a reactive and efficient manner. It separates the presentation layer from business logic and state management, making the codebase more organized and easier to maintain.

### Why BLoC?

- **Separation of Concerns**: BLoC separates business logic and state management from the UI components, enabling better organization and maintainability of the codebase.
  
- **Reactive Programming**: BLoC utilizes streams and stream controllers to handle asynchronous data flow, allowing for reactive updates to the UI based on changes in the application state.
  
- **Testability**: BLoC makes it easier to write unit tests for business logic and state management, ensuring the reliability and correctness of the application.

### How it Works

In the BLoC pattern, the business logic and state management are encapsulated within BLoC classes, which are responsible for processing input events, updating the application state, and emitting output states. UI components such as widgets subscribe to the output states emitted by BLoC classes and update their presentation accordingly.

### Implementation

In this project, the `flutter_bloc` package is used to implement the BLoC pattern for state management. The `flutter_bloc` package provides utilities and abstractions for building reactive Flutter applications with BLoC. It includes `Bloc` and `BlocBuilder` classes for defining BLoC logic and building UI components, respectively.

To learn more about using BLoC for state management in Flutter, refer to the official [flutter_bloc documentation](https://bloclibrary.dev/#/).
