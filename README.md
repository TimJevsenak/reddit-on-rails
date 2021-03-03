<img src="https://timjevsenak.eu/siteIcons/logo.jpg">

# reddit-on-rails
A clone of the social media site reddit. Made with RoR. Reddit-on-rails is an imitation of the website reddit.com. I made it for a school project. It's pretty similar to reddit in terms of basic functions but the design is my own.

# Features
Read-it is a social media platform where users can create communities, share their posts and comment. You can upload your images and customise your profile. 
There is also an admin panel where admins can delete users, posts and communities.

# Installation
Download the files and place them in a folder.

For the first installation run

bundle install

rake db:create

rake db:migrate

After this the database and all the gems should be set.

You have to create your own .env file in the root of the project

In the .env file set your variables:

POSTGRES_USER='postgres'
POSTGRES_PASSWORD='yourpassword'
POSTGRES_HOST='localhost' #localhost for development
POSTGRES_DB='yourdbname'
POSTGRES_TEST_DB='testdb'

BUCKET_NAME='s3BucketName'
AWS_ACCESS_KEY_ID='AWSKey'
AWS_SECRET_ACCESS_KEY='secretAccesKey'

FACEBOOK_APP_ID='appID'
FACEBOOK_APP_SECRET='appSecret'

GOOGLE_OAUTH_CLIENT_ID='googleid.apps.googleusercontent.com'
GOOGLE_OAUTH_CLIENT_SECRET='clientSecret'

GMAIL_USERNAME='your_gmailaccount@gmail.com'
GMAIL_PASSWORD='your_gmail_apppassword'

# Setup
Just log in and if your database is set correctly you are good to go!

# Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

# Language
The website is in english.

Backend is also fully english.
