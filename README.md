# FilmNotes version 0.1 as of 05.01.21

**FilmNotes** is an app for cataloguing your analouge film photography. Add a new **Roll (item)**, and enter notes for each **Exposure (attribute)** you take.

Requires Xcode 11 or later; iOS 13 or later; macOS 10.15 or later.

The key component of **FilmNotes** is the class CoreDataDataSource, which encapsulates much of the functionality of an NSFetchedResultsController in a manner to be useful with SwiftUI. This version of CoreDataDataSource has several custom initialisers for different usage scenarios.
A TabView is used to display and edit the same CoreData database in several ways.

**📷 Tab 1**
> A list view of Rolls (items) and Exposures (attributes) with editing capability.

**✨ Tab 1 to-do**
> Add input fields for box speed, colour/greyscale, date/time, aperture, and shutter speed.

> Connect all input fields to the CoreData model.

> Limit each Roll (item) to 36 Exposures (attributes). Once the Roll is filled, move it to the Shoe Box where it becomes uneditable.

**🐛 Tab 2**
> Two side-by-side instances. This is helpful in debugging, as you can observe CoreData changes in real-time.

**📦 Tab 3**
> CoreDataSource accessed through a nested grouped list, with correct implementations of move and delete.

**☑️ Tab 4**
>ListSelectionManager allows specific actions at the time of the selection or deselection, in addition to inserting and deleting from the selection set. Selecting items is only allowed in Edit mode, which also exposes several commands when active.

**🔍 Tab 5**
>Added a new method to load the Data Source using a NSPredicate to supply data to a ForEach list. Created a UIViewRepresentable SearchBar that accepts the input text and returns a new NSPredicate back to the SwiftUI view after each keystroke.


**🚧 Known Issues**
> Rolls with an identical Name are combined in the Shoe Box. They need to be seperated by Order.

> The NavigationBarTitle shows ghosting from the previous NavigationBarTitle. Fixed by using the In-line style rather than Large style.

> When reordering rows, the first Roll or Exposure in the list becomes Order 0.

> When in the Search tab, there is no way to dismiss the keyboard other than quitting the application.
