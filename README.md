Original App Design Project - README Template
===

# HomeChefHub

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

The App is a culinary companion designed to simplify meal planning and cooking. It offers a plethora of features to help users discover, organize, and create delicious meals effortlessly. The app provides access to an extensive library of recipes, catering to a variety of cuisines, dietary preferences, and skill levels. Users can easily explore and discover new dishes. Users can contribute their favorite recipes, unique variations, and personal tips, enriching the app's content and making it a valuable resource for anyone passionate about cooking and discovering new flavors.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category**: Health & Wellness
- **Mobile**: Mobile platforms are essential for users to access their chosen meditation genre, play soothing music, set timers, and create a calming atmosphere wherever they are. The app harnesses mobile capabilities to provide a seamless meditation experience, ensuring users can relax and focus on their well-being.
- **Story**: The Music Meditation App empowers users to cultivate mindfulness, reduce stress, and enhance their overall well-being through the power of music. Whether seeking to concentrate, find inner calm, or simply relax, users can create their ideal meditation environment with a variety of genre choices and customizable settings.
- **Market**: The app caters to individuals seeking mindfulness, stress relief, and relaxation. It serves a broad audience, including those who want to improve their focus, find tranquility, or unwind after a long day. Users with diverse meditation needs can select from the "Focus," "Calm," or "Relax" genres to suit their specific requirements.
- **Habit**: Users incorporate the app into their daily routines to practice meditation, enhance concentration, or achieve relaxation. By offering a variety of meditation music genres, the app becomes an integral part of users' mindfulness practices and well-being rituals.
- **Scope**: In its initial version (V1), the app provides access to the three primary meditation genres: "Focus," "Calm," and "Relax." Users can select their preferred genre, set timers, and immerse themselves in soothing meditation music. Subsequent versions (V2, V3, V4) may expand features, such as personalized meditation playlists, guided meditation sessions, and additional relaxation tools, catering to users seeking a more immersive meditation experience.
- **API**: https://developers.deezer.com/api

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* Users can discover and view recipes from various cuisines and dietary preferences.
* Users can create personalized meal plans.
* Users can access step-by-step cooking instructions for recipes.
* Users can generate shopping lists based on selected recipes.

**Optional Nice-to-have Stories**

* Users can contribute their own recipes and cooking tips to the app's community, enhancing the collective culinary knowledge.

### 2. Screen Archetypes

- Login/Sign-up Screen
* Users can either log in with their existing credentials or create a new account.
* Once logged in, they can access the app's main features, such as the Home Screen (Recipe Feed), Meal Planning, Recipe Details, Shopping Lists, and User-Generated Content (if the optional feature is included).
- Recipe Feed Screen (Home Screen):
* After logging in, users are directed to the Recipe Feed Screen, where they can discover and browse recipes.
* Featured recipes are displayed.
* Users can search for recipes by various criteria like cuisine, dietary preferences, and ingredients.
- Meal Planning Screen:
* Users can create and manage personalized meal plans.
* They can add recipes to their meal plans.
* Users can generate shopping lists from their meal plans.
- Recipe Detail Screen:
* Users can access detailed information about a selected recipe.
* This screen displays ingredients, cooking instructions, images, and videos for the recipe.
- Shopping List Screen:
* Users can view and manage their shopping lists.
* The screen shows the list of ingredients needed for selected recipes.
- User-Generated Content Screen (Optional):
* If the user-generated content feature is implemented, this screen allows users to contribute their own recipes, cooking tips, and variations.
* Users can explore and engage with content shared by other community members.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Login/Sign-up
* Home (Recipe Feed)
* Meal Planning
* User-Generated Content (Optional)

**Flow Navigation** (Screen to Screen)

- Login/Sign-up Screen:
  * Login/Sign-up => Home (Recipe Feed)
  * Registration => Home (Recipe Feed)
- Home (Recipe Feed) Screen:
  * Home (Recipe Feed) => Recipe Detail Screen
  * Home (Recipe Feed) => Meal Planning Screen
  * Home (Recipe Feed) => Shopping List Screen
  * Home (Recipe Feed) => User-Generated Content Screen (Optional)
- Meal Planning Screen:
  * Meal Planning => Recipe Detail Screen
  * Meal Planning => Shopping List Screen
  * Meal Planning => Home (Recipe Feed)
- Recipe Detail Screen:
  * Recipe Detail => Meal Planning Screen
  * Recipe Detail => Home (Recipe Feed)
- Shopping List Screen:
  * Shopping List => Meal Planning Screen
  * Shopping List => Home (Recipe Feed)
- User-Generated Content Screen (Optional):
  * User-Generated Content => Recipe Detail Screen
  * User-Generated Content => Home (Recipe Feed)

## Wireframes

[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

[This section will be completed in Unit 9]

### Models

[Add table of models]

### Networking

- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
