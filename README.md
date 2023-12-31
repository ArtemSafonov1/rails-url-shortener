## Rails URL Shortener

An URL Shortener is made with Ruby on Rails framework.
It provides an interface where a user can add a link and receive a shortened version back.
When using this link, user is redirected to the original website.

Once a valid URL is submitted, it is recorded in the database so it can be used indefinitely or after it is deleted by the user.
The number of clicks on the link is also calculated.

## Getting Started

The setup steps expect following tools installed on the system:

- Github
- Ruby v3.1.3
- Rails v7.0.7

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/ArtemSafonov1/rails-url-shortener.git
   ```
2. Move to the project folder
   ```sh
   cd ./rails-url-shortener
   ```
3. Install bundle dependencies
   ```sh
   bundle install
   ```
4. Setup project database
   ```sh
   bundle exec rake db:create
   bundle exec rake db:migrate
   ```
5. Start rails server
   ```sh
   bundle exec rails server
   ```
6. Visit the site with the following URL http://localhost:3000/links

### Twilio sms

The `twilio-ruby` [gem](https://github.com/twilio/twilio-ruby) is used for SMS messaging.
After creating new link, application will send sms to the specified mobile phone.
You need specify the following environmental variables to enable this feature:
```sh
export TWILIO_ACCOUNT_SID=ENTER_YOUR_TWILIO_ACCOUNT_SID
export TWILIO_AUTH_TOKEN=ENTER_YOUR_TWILIO_AUTH_TOKEN
export TWILIO_ACCOUNT_NUMBER=ENTER_YOUR_TWILIO_ACCOUNT_NUMBER
export YOUR_PHONE_NUMBER=ENTER_YOUR_VERIFIED_PHONE_NUMBER
```