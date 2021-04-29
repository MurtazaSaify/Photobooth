# Photobooth

This repo hosts source for Photobooth application which is a pretty simple app which allows one to capture photo, provide title to it and save it. 
Captured photos ca be viewed any time by tapping `View Photos` option from home screen.

Technology used:

Language: Swift

Architecture: SwiftUI with VIPER

Database: Core Data

The source code is primarily structured into 4 modules:

# CommonModule :
Common module is mainly responsible for hosting common classes, interfaces and files which are used across other modules. 
It primarily hosts the source responsible for below areas:

- FileManager interface and implementation to facilitate file i/o operations
- Database model and CoreDataStack interface and implementation to facilitate ManagedObjectContext.
- Common interface for VIPER modules to facilitate module creation.
- Common UI components such as ImagePicker.

# PhotoboothHomeModule :
PhotoboothHomeModule is the module responsible for application home screen carrying options to capture new photo or view existing photos.
The module is built with SwiftUI using VIPER architecture. 

- On tap of `Take a photo` button, the module launches the image picker and upon picking the image passes it to RecordPhotoDetailsModule to provide photo details such as title etc.
- On tap of `View Photos` button, the module navigates to PhotoListViewModule to show already captured photos.

# RecordPhotoDetailsModule :
RecordPhotoDetailsModule is the module responsible for recording details such as creation time and title for the captured photo and saving it to database.
The module is built with SwiftUI using VIPER architecture. 

# PhotoListViewModule :
PhotoListViewModule is the module responsible for retrieving the already captured photos information from database and listing them by creation time.
The module is built with SwiftUI using VIPER architecture. 

- The module retrieves the captured photos from database and list them in a sorted manner.
- On tapping of any photo item in list the module redirects user to photo details page.

# ShowPhotoDetailsModule:
ShowPhotoDetailsModule is the module responsible for showing the details of the selected photo item from photo list in a bigger layout.
The module is built with SwiftUI using VIPER architecture.

# Tests:

The repository has good unit test coverage for all the major business use cases involved in app. Tests can be executed be selecting `PhotoboothTests` scheme and performing `command+U`.
Tests are also divided on module bases to have a clear segregation of use cases covered per module.
