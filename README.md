# SW-Lab-U02_W05_D23_25-WorldTrotter-iter4
Fourth iteration of WorldTrotter App where an instance of UITextField is added to the conversion screen. The text field will allow the user to type in a temperature in degrees Fahrenheit that will then be converted to degrees Celsius and displayed on the interface.

## Topics
1. Text Editing
   - `UITextField`
2. Keyboard attributes
   - `UITextInputTraits`
3. Responding to text field changes
   - `.editingChanged`
4. Dismissing the keyboard
   - `UITapGestureRecognizer
5. Number Formatters
   - `NumberFormatter` 
3. Delegate Design Pattern
   - Conforming to a Protocol
   - Using a delegate
   - Implement `UITextFieldDelegate`


## Description
1. Fourth iteration of WorldTrotter App where an instance of `UITextField` is added to the conversion screen. The text field will allow the user to type in a temperature in degrees Fahrenheit that will then be converted to degrees Celsius and displayed on the interface.
2. Bronze challenge: _**Disallow Alphabetic Characters**_ 
   - Currently, the user can enter alphabetic characters either by using a Bluetooth keyboard or by pasting copied text into the text field. Fix this issue 
3. Silver Challenge: _**Displaying the User’s Region**_ 
   - Display and zoom in on the user’s location on the map. `MKMapView` has a mechanism for _**displaying a blue dot annotation on the map**_, but there is no built-in way to _**zoom in on that location**_. To get this to work, you will need to do a few things: 
   - Add a _**“Privacy – Location When In Use Usage Description” key**_ to your application’s _**Info.plist**_. This key is associated with a description that tells your users why you will be accessing their location information. 
   - Ask the user for permission to find their location. You will need to add a property to `MapViewController` for a `CLLocationManager` instance and call `requestWhenInUseAuthorization()` when the `MapViewController`’s view appears. This will present an alert to the user with the usage description requesting their permission to get their location. 
   - Use the user’s location to zoom in on their map region. To do this, assign the map’s `delegate` property. Look through the documentation for `MKMapViewDelegate` and find the appropriate callback to get informed when the user’s location has been updated.
   - Implement this method to set the region on the map, either directly or using `setRegion(_:animated:)`.

## Deadline 
Sunday 7th November 09:15 am
