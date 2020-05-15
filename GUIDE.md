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
    heroku config:set DEVISE_JWT_SECRET_KEY=`bin/rake secret`

If you have a custom domain you wish to you set it like so.

`heroku domains:add myapp.com`

# CONFIGURING STORAGE

This app uses [Active
Stoage](https://edgeguides.rubyonrails.org/active_storage_overview.html) so it is very flexible.
If you are using Heroku you must set some storage service credentials.
For Heroku Amazon S3 is recommended. Set credentials by editing
config/credentials.yml by starting an editor like so.

`EDITOR=vim rails credentials:edit`

Fill in your credentials and save the results.

    aws: # Be sure to remove the comments
      access_key_id: <123 credentials here>
      secret_access_key: <345 credentials here>

Now commit the changes and deploy them with.

`git add config/credentials.yml.enc`
`git commit -m "configuring s3 credentials"`
`git push heroku master`

Backup ./config/master.key somewhere outside your repository.

# AFTER SETUP

Your APP_SERVER URL will be either "https://myapp.com" (or the default
domain for your provider like Heroku provides).
"https://sleepy-goat-28376737.herokuapp.com".

Now you can login to the admin panel here:

#{APP_SERVER}/admin/login

Use the credentials in db/seeds.rb for AdminUser and be sure to change
your password after logging in here:

#{APP_SERVER}/admin/admin_users/1/edit

Optionally remove or change the user account passwords under

#{APP_SERVER}/admin/users

# COPYRIGHT

&copy; 2020 Janet Braswell-Jeffus
See includeed
[LICENSE.md](https://github.com/jjeffus/mayim-app/blob/master/LICENSE.md).
