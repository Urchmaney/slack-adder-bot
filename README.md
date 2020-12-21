# Slack Adder Bot

A simple slack bot that adds two number.
It takes input in the following format:  {digit} + {digit}

E.g  3 + 4

## Technology:
- Ruby
- Rails
- Figaro (Environment variable manager)

## Running
- clone repository  &emsp;` git clone https://github.com/Urchmaney/slack-adder-bot.git`
- run &emsp; `cd slack-adder-bot`
- run &emsp; `bundle install` to install gems
- run &emsp; `bundle exec figaro install` to install figaro for environment variable
- go to &emsp;`config/application.yml`&emsp;and add your slack bot token. Add it as `SLACK_BOT_TOKEN`
- That all. you can start the server with `rails s`.
- Add the slack app to your slack work space, and you can interact with the bot.