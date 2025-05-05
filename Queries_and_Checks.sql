SELECT s.title, a.title AS album, ar.artist_name, s.play_count

--Get the most played songs
SELECT s.title, a.title AS album, ar.artist_name, s.play_count
FROM songs s
JOIN albums a ON s.album_id = a.album_id
JOIN artists ar ON s.artist_id = ar.artist_id
ORDER BY s.play_count DESC
LIMIT 10;

--List users with their active subscriptions and payment method
SELECT u.username, u.email, s.subscription_date, s.subscription_renewal_date, s.pay_method
FROM users u
JOIN subscriptions s ON u.user_id = s.subscriber_id;

--Get all favorite albums of a specific user
SELECT u.username, a.title AS album_title, ar.artist_name
FROM user_favorite_albums ufa
JOIN users u ON ufa.user_id = u.user_id
JOIN albums a ON ufa.album_id = a.album_id
JOIN artists ar ON a.artist_id = ar.artist_id
WHERE u.username = 'CarlosP';

--Show all songs of a specific artist
SELECT s.title AS song_title, a.title AS album_title
FROM songs s
JOIN albums a ON s.album_id = a.album_id
JOIN artists ar ON s.artist_id = ar.artist_id
WHERE ar.artist_name = 'C. Tangana';

--Count the number of songs by each artist
SELECT ar.artist_name, COUNT(s.song_id) AS total_songs
FROM artists ar
JOIN songs s ON ar.artist_id = s.artist_id
GROUP BY ar.artist_name
ORDER BY total_songs DESC;

--Number of playlists created by each user
SELECT u.username, COUNT(p.playlist_id) AS total_playlists
FROM users u
LEFT JOIN playlists p ON u.user_id = p.user_id
GROUP BY u.username;

--Show payment information (PayPal or Card) for each subscriber
SELECT u.username, s.pay_method,
       c.card_number, c.expiration_month, c.expiration_year,
       p.paypal_username
FROM users u
JOIN subscriptions s ON u.user_id = s.subscriber_id
LEFT JOIN cards c ON s.subscriber_id = c.subscriber_id
LEFT JOIN paypal p ON s.subscriber_id = p.subscriber_id;

--Favorite songs of a user ordered by the date they were added
SELECT s.title, s.play_count, ufs.favorite_date
FROM user_favorite_songs ufs
JOIN songs s ON ufs.song_id = s.song_id
WHERE ufs.user_id = 1
ORDER BY ufs.favorite_date DESC;