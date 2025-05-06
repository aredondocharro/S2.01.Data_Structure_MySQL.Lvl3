# Simple Spotify Database Model

This document outlines a basic database model for Spotify.

## User Types

There are two types of users: **Free** and **Premium**.

## User Information

For each user, we store the following information:

* **Email** (Unique Identifier)
* Password
* Username
* Date of Birth
* Gender
* Country
* Postal Code

## Premium Subscriptions

**Premium** users have subscriptions. The following data is stored for each subscription:

* Subscription Start Date
* Service Renewal Date
* Payment Method (Credit Card or PayPal)

### Credit Card Information

If the payment method is a credit card, we store:

* Credit Card Number
* Expiration Month and Year
* Security Code

### PayPal Information

If the payment method is PayPal, we store the:

* PayPal Username

### Payment History

We need to keep track of all payments made by a **Premium** user during their subscription period. For each payment, we store:

* Date
* Order Number (Unique)
* Total Amount

## Playlists

A user can create multiple **playlists**. For each **playlist**, we store:

* Title
* Number of Songs
* Unique Identifier
* Creation Date

### Deleted Playlists

When a user deletes a **playlist**, it is not permanently removed from the system. Instead, it is marked as deleted. This allows users to recover their **playlists** if they were deleted by mistake. We need to store the date when the **playlist** was marked as deleted.

### Playlist Types

There are two types of **playlists**: **Active** and **Deleted**.

* An **active** **playlist** can be shared with other users, allowing them to add songs.
* For shared **playlists**, we need to know which user added each song and on what date.

## Songs, Albums, and Artists

* A song can only belong to one album.
* An album can contain many songs.
* An album is released by a single artist.
* An artist can release many albums.

### Song Information

For each song, we store a unique identifier:

* Title
* Duration
* Number of Times Played by Spotify Users

### Album Information

For each album, we store a unique identifier:

* Title
* Publication Year
* Cover Image

### Artist Information

For each artist, we store a unique identifier:

* Name
* Artist Image

## User Preferences and Relationships

* A user can follow many artists.
* An artist can be related to other artists who make similar music. This allows Spotify to suggest related artists to users based on their preferences.
* We also need to store a user's favorite albums and songs. A user can select many albums and songs as favorites.

## 🗄️ Database Management

- **Database system:** MySQL 8  
- **GUI client:** DBeaver 25.09.3

### 🛠️ Connection Parameters

- **Host:** `localhost`  
- **Port:** `3308`  
- **User:** `root`  
- **Password:** `root`  
- **Database name:** `spotify`

> 💡 You can use DBeaver or any preferred SQL client to explore, manage, and query the database structure.
