# shopping_app_with_firebase

A new Flutter project.

## Getting Started

This project uses firebase for authentication.

## Widgets used in Login Page:

  - Scaffold
      - body
          - SingleChildScrollView to make page scrollable
              - Form to take data from user and validate it
                  - Column to put widgets vertically
                      - TitleText to add "Login" as the title of the page
                      - CustomTextField to ask the user to enter his email and password
                      - CustomButton to sign in with firebase
                      - GlobalTextButton to navigate to sign up page

## Widgets used in Sign up Page:

  - Scaffold
      - body
          - SingleChildScrollView to make page scrollable
              - Form to take data from user and validate it
                  - Column to put widgets vertically
                      - TitleText to add "Sign up" as the title of the page
                      - CustomTextField to ask the user to enter his name,email, password and confirm password
                      - CustomButton to sign up with firebase
                      - GlobalTextButton to navigate to login page
