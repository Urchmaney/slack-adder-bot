# Slack Adder Bot

A simple Slack bot that adds two number.
It takes input in the following format:  {digit} + {digit}

e.g  3 + 4

## Technology
- Ruby
- Rails
- Figaro (Environment variable manager)
- Postgres

## Running
- Clone repository  &emsp;` git clone https://github.com/Urchmaney/slack-adder-bot.git`
- Run &emsp; `cd slack-adder-bot`
- Run &emsp; `bundle install`&emsp; to install gems
- Run &emsp; `bundle exec figaro install`&emsp; to install figaro for environment variable
- Setup your slack application. Go to &emsp;`https://api.slack.com/apps`.&emsp; You can follow this tutorial&emsp;`https://dev.to/oghenebrume50/building-a-slack-bot-with-nodejs-3g40`
- Go to &emsp;`config/application.yml`&emsp;and add some slack variables. The following variables are important:&emsp;`SLACK_CLIENT_ID`&emsp;`SLACK_CLIENT_SECRET`.
- Since we using postgres as database, make sure postgres is install on your machine.
- Run the following to set up database &emsp;`rake db:create && rake db:migrate`
- That all. you can start the server with &emsp;`rails s`.
- Add the slack app to your slack work space, and you can interact with the bot.