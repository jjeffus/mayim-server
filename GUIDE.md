![Mayim Chat](/graphics/mayim_logo.png?raw=true "Mayim Chat")

# SERVER SETUP GUIDE

## Deploying to Heroku

Clone the server repo to your local machine and run the following
commands in the directory. You must first have the
[Heroku](https://devcenter.heroku.com/articles/heroku-cli) cli setup and
logged in with your account.

`heroku create`
`heroku addons:create rediscloud:30`
`git push heroku master`
`heroku run bundle exec rake db:migrate`
`heroku run bundle exec rake db:seed`

If you have a custom domain you wish to you set it like so.

`heroku domains:add www.myapp.com`


# COPYRIGHT

&copy; 2020 Janet Braswell-Jeffus
See includeed
[LICENSE.md](https://github.com/jjeffus/mayim-app/blob/master/LICENSE.md).
