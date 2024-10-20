
# Pixel Proof - Image Forgery Detection App 📸


Pixel Proof is an innovative mobile application designed to detect image manipulation and forgery using advanced machine learning models. Built with Flutter for a cross-platform UI and powered by FastAPI and custom-trained models deployed on Hugging Face, Pixel Proof empowers users to verify the authenticity of images quickly and effectively.
![Echofetch](https://github.com/user-attachments/assets/a9d00c22-6767-401b-82c5-fbbd4046e923)

## 📜 Table of Contents
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [How It Works](#how-it-works)
- [Screenshots](#screenshots)
- [Future Scope](#future-scope)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- **User-Friendly Interface**: Upload images from the mobile gallery to scan them for potential manipulation.
- **Real-Time Image Forgery Detection**: Identifies tampering using custom-trained models deployed on Hugging Face.
- **FastAPI Backend**: Communicates with the FastAPI backend to process images and provide analysis results.
- **Instant Feedback**: Receive instant results on the authenticity of uploaded images.

## 🛠️ Technology Stack

- **Flutter**: Frontend for creating a cross-platform mobile application.
- **FastAPI**: Backend API service for handling image processing and running detection models.
- **Hugging Face**: Hosting and deployment of a custom-trained machine learning model for image forgery detection.

## 🚀 Installation

### 1. Clone the repository
First, clone this repository to your local machine:
```bash
git clone https://github.com/Kamal934/PixelProof.git
cd PixelProof
```

### 2. Install Flutter dependencies
Ensure you have Flutter SDK installed on your machine. Then, in the project directory, run:
```bash
flutter pub get
```

### 4. Running the App
To launch the Pixel Proof mobile app, connect your device or emulator and run:
```bash
flutter run
```


## 💡 How It Works

 - **Image Upload**: Users can upload images from their mobile gallery through the app.
 - **Backend Processing**: The app sends the image to the FastAPI backend, which processes it using a custom-trained model hosted on Hugging Face.
 - **Forgery Detection**: The backend analyzes the image for signs of tampering and returns a result, which is displayed to the user.
 - **Real-Time Feedback**: Users receive immediate feedback on the image’s authenticity.


## 📸 Screenshots


| Home Screen | Upload Image | Scanning | Analysis Result |
|-------------|--------------|----------|-----------------|
| ![Home Screen](https://github.com/user-attachments/assets/80efe3b6-46c3-44e6-87b6-e3d36d540e31) | ![Upload Image](https://github.com/user-attachments/assets/437a7106-d5e8-4fab-993c-8ea8559a4c0a) | ![Scanning](https://github.com/user-attachments/assets/8de5e026-8254-42ff-8b8d-26ae065e63c6) | ![Result](https://github.com/user-attachments/assets/9e604684-da09-47c8-ab07-902e49a65c97) |



## 🔮 Future Scope

1. **Automatic Image Capture**: Enable users to capture images directly from the app for on-the-spot analysis.
2. **Batch Image Scanning**: Support for scanning multiple images at once to improve productivity.
3. **Cloud-Based Processing**: Integration with cloud storage solutions (e.g., Google Drive, Dropbox) for remote image uploads and analysis.
4. **Enhanced Detection Models**: Incorporate more advanced models to detect deepfakes and other sophisticated manipulations.
5. **Tamper Analysis History**: Maintain a detailed log of all scanned images, providing users with a history of forgery checks and results.

## 🤝 Contributing

We welcome contributions from the community! To get started:

1. Fork the repository.
2. Create a new branch for your feature or bug fix:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add feature'
   ```
4. Push the branch to your forked repository:
   ```bash
   git push origin feature-name
   ```
5. Create a Pull Request detailing your changes.

## 📝 License

This project is licensed under the Apache License - see the [LICENSE](LICENSE) file for details.

---

Thank you for checking out **Pixel Proof**! We hope this project inspires further innovation in image integrity verification.

