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
[Evaluation of your app across the following attributes]
- **Category:** Health & Fitness/Productivity/Graphics & Design/Social Networking/Lifestyle
- **Mobile:** Faster/Easy acces to camera/Upload & update easily
- **Story:** 
- **Market:** People who wants to track their habit and make things organized 
- **Habit:** Maintain a healthy lifestyle/Custom UI design/Share with friends
- **Scope:** 

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User registration
* Login/Auth
* User profile page
* Overview of all habits
* Track habits
* Creat/Delete habit
* Share habits with friends 

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
[Add picture of your hand sketched wireframes in this section]
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
[This section will be completed in Unit 9]
### Models
TBD
### Networking
- Login, logout, share, post
- [OPTIONAL: List endpoints if using existing API such as Yelp]
