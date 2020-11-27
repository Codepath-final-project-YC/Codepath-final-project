Original App Design Project
===

# Habit Tracker

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This an app to keep track of your habits, and share with your friends. 

### App Evaluation
- **Category:** Health & Fitness/Productivity/Graphics & Design/Social Networking/Lifestyle
- **Mobile:** Faster/Easy acces to camera/Upload & update easily
- **Story:** Mentor's suggestion
- **Market:** People who wants to track their habit and make things organized 
- **Habit:** Maintain a healthy lifestyle/Custom UI design/Share with friends
- **Scope:** Young people

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
(click to check the gif)
- [x] [User registration](https://recordit.co/uNjd13cHUo)
- [x] [Login/Auth](https://recordit.co/KZ3CEGNs6c)
- [ ] User profile page
- [ ] Overview of all habits
- [ ] Track habits
- [ ] Creat/Delete habit
- [ ] Share habits with friends 


**Optional Nice-to-have Stories**

* Compete with friend on continuing improvement for a habit
* Set goals and be able to share if you accomplish the goal

### 2. Screen Archetypes

* Sign up screen
   * enter your name
   * enter your email
   * enter your password
* Login screen
   * enter your email
   * enter your password
* profile screen
   * Check your progress
   * Check your friends progress
   * Go to your habits 
   * Logout
* habits screen
   * start new habit
   * set a goal
   * post on feed
   * show off
* show off screen
   * post your progress
* congratulations screen
   * share with your friends
   * go to your profile
   * logout
   
   

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Sign Up
* Login
* profile
* mine
* friends
* habits
* Start habit
* Task Board
* Show off
* habit
* congratulations
* share
* logout


**Flow Navigation** (Screen to Screen)


* tap on a screen
   * Habit Log -> Congratulations
 
* tap on a label
   * Sign Up 
       * Login -> Log In
       * Sign Up -> Log In
   * Log In
       * Log In -> Profile/Mine
   * Habits
       * New -> Compose
       * Navigation Bar -> Task Board
   * Task Board
       * Back -> Habits
       * Show -> Show off
   * Show off
       * Back -> Task Board
       * Profile -> Profile/Mine
   * Profile/Mine
       * Habits -> Habits
       * Logout -> Log In
       * Mine -> Profile/Friends
       * Instance of habits -> Habit Log
   * Profile/Friends
       * Habits -> Habits
       * Logout -> Log In
       * Friends -> Profile/Mine
       * Instance of friends -> Messages
   * Messages
       * Mine -> Profile/Friends
       * Friend -> Contacts
   * Compose
       * Start -> Habit Log
   * Congratulations
       * Yeah! -> Compose
       * Share with friend -> Messages
   * Contacts
       * Profile -> Profile/Mine
       * Instance of chats -> Messages

   

## Wireframes
[Overview](https://i.imgur.com/T0N8ukh.png)

<img src="http://g.recordit.co/zNU3nuEUxx.gif" width=600>

Compose             |  Congratulations |  Contacts | Habit Log
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://i.imgur.com/fSaPqB4.png)  |  ![](https://i.imgur.com/d1zScgd.png) | ![](https://i.imgur.com/nVs1jB2.png) | ![](https://i.imgur.com/Xt1iLXd.png)

Habits             |  Log In |  Messages | Profile/friends
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://i.imgur.com/bYqBQkn.png)  |  ![](https://i.imgur.com/knHNdxm.png) | ![](https://i.imgur.com/C9vtHY8.png) | ![](https://i.imgur.com/oY7Iamt.png)

Show Off             |  Task Board |  Sign Up | Profile/mine
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://i.imgur.com/UHQHboU.png)  |  ![](https://i.imgur.com/jQBZYdy.png) | ![](https://i.imgur.com/kQikqWh.png) | ![](https://i.imgur.com/a1LRdl6.png)


## Schema 
### Models
#### Habits

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the user habit (default field)|
   | user        | Pointer to User| who create this habit |
   | caption       | String   | habit caption by user |
   | createdAt     | DateTime | date when habit is created (default field) |
   | updatedAt     | DateTime | date when habit is last updated (default field) |
   | endAt     | DateTime | date when habit is done (default field) |
| likesCount    | Number   | number of likes for the post |
| commentsCount | Number   | number of comments that has been posted to an image |

### Networking
#### List of network requests by screen
- Sign up screen
    * (Create/POST) Create a new user password pair
- Login screen
   * (Read/GET) Query logged in user's encrypted username and password
- profile screen
    * (Read/GET) Query logged in user object
    * (Update/PUT) Update user profile image, username, password...
- habits screen
   *  (Read/GET) Query all habits where user is author
   * (Update/PUT) Update user habit status
   * (Create/POST) Create a new habit
   * (Delete/DELETE) Delete a new habit
- show off screen
   * (Read/GET) Query all habits where user is author
- congratulations screen
   * (Read/GET) Query current habit status


#### [OPTIONAL:] Existing API Endpoints
##### APIs for Habit Tracker
- Base URL - [http://www.habittracker.com]

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`     | /users | get all users username, habits list, ...
     `GET`     | /user/:id | get one user's info
    `GET`    | /habits | get all habits from all users
    `GET`    | /habit/:id | get all habits from one user
    `PUT`     | /users | update all users username, habits list, ...
     `PUT`     | /user/:id | update one user's info
    `PUT`    | /habits | update all habits from all users
    `PUT`    | /habit/:id | update all habits from one user    
     `CREATE`     | /user/:id |  create one user's info
    `CREATE`    | /habit/:id | create all habits from one user        
    `DELETE`     | /user/:id | delete one user's info     
    `DELETE`    | /habit/:id | delete all habits from one user        

