# Nat.Ly
## awesomer version of `bit.ly`

## Setup
##### Configuration
* Ruby version - 2.4.0
* Rails version - Rails 5.0.6

Postgres is a dependency of the app. It must be installed and running. Easiest way is to use [homebrew](http://brew.sh/).
##### Installing Postgres
```
brew install postgres
echo "export PGDATA='/usr/local/var/postgres'" >> ~/.bash_profile
source ~/.bash_profile
```

##### Running Postgres
```
pg_ctl start
```

##### Database tasks
  - `rake db:setup`
  - `rake db:seed`

##### Running the app.
```
bundle
rails s
```

##### RUBOCOP
###### Run rubocop with chosen settings for all or specific files
- run `rubocop` in console which returns offenses occording to default preferences found @
https://github.com/bbatsov/rubocop/blob/master/config/default.yml
- to disable some Cops, overide preferences in `.rubocop.yml`

###### Autocorrect
- run `rubocop --auto-correct` to auto-correct as much as possible - ex: spacing you messed up

###### Easy way to go through each offense using `to_do` file
- run `rubocop --auto-gen-config` to create a `.rubocop_todo.yml`
- to use the todo file, uncomment out `inherit_from: .rubocop_todo.yml` in `.rubocop.yml`
- to correct offenses one by one, comment out the one you want to correct in the todo file

------------------------------
##### Future Directions
- normalize urls -> `http://google.com/` and `http://google.com` would get saved as the same url
- display top 100 in a cooler way
- add es6
