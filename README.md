# shopping_app_with_firebase

A new Flutter project.

## Getting Started

This project uses fingerprint to let user open his profile

To do that:
- I cached username and email when signing up
- In homePage, I added a profile button, when it's pressed, it calls authenticate function
- authenticate function requests user's fingerprint and checks on it
- If fingerprint is correct, user will view his profile successfully
- If it's not correct or it failes, a Scackbar will show up with "Failed" message
- In profile page, "getUserData" function is called in "initState" to get cached username and email

## Widgets used in Profile:

  - Scaffold
      - appBar to put page title
      - body
         - Column to add some widgets vertically
             - CircleAvatar to put user image
             - Text inside Padding to put username if it's loaded
             - UserDetailItem to view username and email
