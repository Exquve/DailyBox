# DailyBox

DailyBox is a minimalist utility application that simplifies your daily life. With a modern and clean interface, it brings together the essential tools you need for your daily tasks.

## 🌟 Features

### 📝 Notes
- Quick note-taking
- Timestamp and location recording
- Note editing and deletion
- Minimalist note view

### 💰 Budget Tracking
- Multi-currency support (USD, EUR, TRY, GBP, etc.)
- Income and expense tracking
- Add descriptions
- Currency-based summaries
- Automatic balance calculation

### 📱 QR Code
- QR code generation
- QR code scanning (simulation)
- Text, URL, and email support
- Copy generated codes

### 🔗 Link Shortener
- is.gd API integration
- Custom alias support
- Link history
- One-click copy

### 🔄 File Converter
- Image to PDF conversion
- Multiple image selection
- Gallery and file picker support
- Ready infrastructure for future features

## 🎨 Theme Support

- **Light Theme**: Minimalist white design
- **Dark Theme**: Eye-friendly dark design
- **System Theme**: Automatic theme selection
- Instant theme switching

## 📱 Platform Support

- Android
- iOS
- Web

## 🛠️ Technical Features

### Technologies Used
- **Framework**: Flutter 3.x
- **State Management**: Provider
- **Database**: SQLite
- **HTTP Requests**: HTTP package
- **Location Services**: Geolocator
- **QR Code**: qr_flutter
- **File Operations**: file_picker, path_provider
- **PDF Generation**: pdf package

### Data Storage
- All data is stored in a local SQLite database
- User activities are recorded with timestamps and location information
- Secure and fast data access

### Permissions
- **Internet**: For link shortener API
- **Location**: To record activity locations
- **Camera**: For QR code scanning
- **Storage**: For file operations

## 🚀 Installation

1. Make sure Flutter SDK is installed
2. Clone the project
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart              # Main application file
├── models/                # Data models
├── screens/               # Screen widgets
├── services/              # Business logic services
├── theme/                 # Theme configuration
└── widgets/               # Reusable widgets
```

## 🔮 Future Features

- **Map Integration**: Displaying activities on a map
- **More File Converters**: Audio, video, and document conversion
- **Backup & Sync**: Cloud backup
- **Widgets**: Home screen widget support
- **Categories**: Note and budget categories
- **Statistics**: Usage analytics

## 🎯 Target Audience

DailyBox is designed for anyone who wants to quickly and effectively accomplish small but important tasks in their daily life. Thanks to its minimalist design, even users without technical knowledge can easily use it.

## 📄 License

This project is distributed under the MIT License.

---

**DailyBox** - Your minimalist companion that simplifies your daily life 📦✨
