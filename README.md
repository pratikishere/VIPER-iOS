# VIPER-iOS
This repo is to demonstrate how can VIPER architecture be used in iOS.

# Core components of VIPER
| Module | Responsibility |
| -------| -------------- |
| View | Displays UI - UIView, UIViewController, SwiftUI View. It forwards user actions to presenter. |
| Interactor | Contains business logic. Perform data operations such as API calls, database |
| Presenter | Decides what to show and how. It is mediator between View and Interactor. Formates data for display. |
| Entiy | Plain data model (class/struct). Used by Interactor. |
| Router | Handels navigation logic. |

## Login feature specs

### User Story 1: Successful login

```
As a user
I want to log in with valid credentials
So that I can access the home screen with welcome message
```

#### Acceptance criteria

```
Given the user is on login screen
When user enters correct email and password and taps on login button
Then the loading indicator should appear
And after successful authentication
Then the loading indicator should disappear
And app should navigate to home screen
And Home screen should display welcome message
```

### User Story 2: Invalid credentials

```
As a user
I want to be informed when login fails
So that I can correct my input
```

#### Acceptance criteria

```
Given the user is on login screen
When user enters wrong email and password and taps on login button
Then a loading indicator should appear briefly
And the loading indicator should disappear
And an error alert should appear with title "Error"
And the alert message should contain "Invalid credentials"
And the user should remain on the Login screen
```

### User Story 3: Empty feilds validation

```
As a user
I want to be prevented from submitting empty fields
So that I avoid unnecesssary failed attempts
```

#### Acceptance criteria

```
Given the user is on login screen
When the user taps the "Login" button without entering email or password
And an error alert should appear immediately
And the alert message should be "Please fill all fields"
And the user should remain on the Login screen
```

### User Story 4: UI responsiveness during login

```
As a user
I want to see visual feedback during login
So that I know the app is processing my request
```

#### Acceptance criteria

```
Given the user has entered valid credentials
When the user taps the "Login" button
Then the "Login" button should be disabled
And a spinning progress indicator should be visible
And when login completes (success or failure)
Then the button should be re-enabled
And the progress indicator should disappear
```

### User Story 5: Navigation and state preservation

```
As a user
I want to see the correct welcome message
So that the app remembers who I am
```

#### Acceptance criteria

```
Given the user successfully logs in with email "test@gmail.com"
When the app navigates to the Home screen
Then the welcome text should exactly read: "Welcome, test@gmail.com!"
And no placeholder or generic text should be shown
```

### Non-functional acceptance criteria

| Criteria | Definition |
| -------| -------------- |
| Performance | Login response(mock) must complete within 1 second |
| Accessibility | All fields and buttons must have accessibility labels |
| Test Coverage | Unit tests must cover Presenter, Interactor, Router, HomeView |
| Integration Test | End to end flow must pass in UI test |
| Platform | Must work on iOS 18+, iPhone, iPad |











