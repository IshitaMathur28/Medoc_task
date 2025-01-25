
# Project Title: **Medoc Health App**

## Description
Medoc Health is an app designed to track and manage women’s health. It provides insights into various health metrics such as menstrual cycles, exercise routines, and overall wellness. The app offers a user-friendly interface to input, track, and visualize health data, aiming to support women in monitoring their well-being.

## Setup Instructions
1. **Clone the repository**:
   
   git clone <repository-url>

2. **Navigate to the project directory**:
  
   cd <project-directory>
   
3. **Install dependencies**:
  
   flutter pub get

4. **Run the application**:


   flutter run


## Dependencies
- **provider**: Used for state management to manage and share app data across widgets.
- **charts_flutter**: Provides charts for visualizing health data like exercise and menstrual cycle.
- **http**: Enables API communication to fetch real-time health-related data.
- **flutter_local_notifications**: Handles local notifications for reminders and alerts.

## Features
- **Health Data Tracking**: Allows users to log menstrual cycles, exercise, and wellness metrics.
- **Charts**: Visualizes health trends and provides insights through customizable charts.
- **API Integration**: Retrieves real-time health data and keeps the app updated.
- **User Notifications**: Sends reminders for health tracking, such as period tracking or exercise schedules.

## Challenges
- **State Management with Provider**: Managing state across the app’s various components was a challenge, solved by careful use of Provider for efficient data sharing.
- **Charts Customization**: Customizing the charts to display detailed health data required fine-tuning the `charts_flutter` package.
- **Women Health UI**: Designing an intuitive and user-friendly UI to cater specifically to women’s health needs required balancing aesthetics and functionality.
- **API Integration**: Handling multiple API responses and ensuring smooth synchronization with the app’s UI was a challenge overcome through robust error handling and data validation.
- **Responsiveness**: Ensuring the app works across different screen sizes and devices involved extensive testing and UI adjustments.

## Future Enhancements
- **Machine Learning Integration**: Implement predictive analytics for better health forecasting based on user data.
- **Data Export**: Add features to export health data in various formats (CSV, PDF).
- **Community Features**: Include a forum or support network for users to connect and share health tips.
- **More Customization**: Allow users to create personalized health plans and track additional metrics.

## Screenshots/GIFs
  ![Screenshot 2025-01-25 224635](https://github.com/user-attachments/assets/425eee67-de6e-46a7-89d0-8fe3c2fb14ea)
![Screenshot 2025-01-25 224630](https://github.com/user-attachments/assets/268b10cf-306d-4f9b-84f6-bec420b17240)
![Screenshot 2025-01-25 224622](https://github.com/user-attachments/assets/613aef45-d39c-4223-aea7-45150c4c5e85)
![Screenshot 2025-01-25 224616](https://github.com/user-attachments/assets/39720d20-8a20-4c8d-b552-d72047effb5c)
![Screenshot 2025-01-25 224608](https://github.com/user-attachments/assets/1b621841-e98c-47c2-9a1f-b1d6e3f4951c)
![Screenshot 2025-01-25 224602](https://github.com/user-attachments/assets/d856ce23-c3a3-4245-9edd-cc0bb0f3e5a3)
![Screenshot 2025-01-25 224553](https://github.com/user-attachments/assets/cefaef65-c8ae-4158-b93f-be51f2ee85a6)
![Screenshot 2025-01-25 224543](https://github.com/user-attachments/assets/c4faab15-28b4-4cd8-b5d2-cf02488b4dee)
