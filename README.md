#Commitwith

Commitwith.com is a webapp that helps developers find open source projects. 

## Built With

* Ruby - 2.1.5
* Rails on Rails - 4.1.8
* Backbone.js
* postgres - 0.17.1

## Setup

```
$ git clone https://github.com/ndelrossi/commitwith.git
$ cd commitwith
$ bundle install
```
Copy(don't rename) config/database.yml.example to config/database.yml and edit with your database settings.
```
$ rake db:create
$ rake db:migrate
```
Run this if you want to seed the database with some projects. Note: This will delete all projects first.
```
$ rake db:seed
```
## Notes

 * Confirmation email for new projects is only sent on production
 * last_update attribute will only auto-update in production

## Testing

This project uses RSpec. Run the tests with:

```
$ rspec spec
```

## Contributing

Contributions are welcome from developers of any level. Check the open issues to find something to work on. If you have a feature idea or you found a bug, please open a new issue.

 * Fork the repository and clone it locally
 * Create a new branch for your feature or bug fix
 * Write your code and make sure tests are passing
 * Open a pull request

 If you have any questions email nickwtf@gmail.com
