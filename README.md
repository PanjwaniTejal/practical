### Devise for authentication (Sign up & Sign in)
1) gem 'devise'
2) bundle install
3) rails generate devise:install
4) rails generate devise user
5) rails db:migrate

### Bootstrap for UI Design
1) gem 'bootstrap'
2) bundle install
3) @import "bootstrap"; in application.scss

### Jqury
1) gem 'jquery-rails'
2) bundle install
3) require jquery3, popper, bootstrap in appplication.js

### letter opner
1) gem 'letter_opener'
2) config.action_mailer.delivery_method = :letter_opener Add into development.rb

### Font Awesome
1) gem 'font-awesome-rails'
2) @import "font-awesome"; in application.scss

### Sidekiq for background job
1) gem 'sidekiq'
2) config.active_job.queue_adapter = :sidekiq
3) Use ActiveJob for


### Remaining Functionality
Create an API to add single product using AuthenticationToken.

### Release Note
1) User register thier account and confirm email address after their they need to logged in
2) After that the can perform CURD opration on product
3) Using 'Import CSV' user can upload bluck of data into database. (Attached Sample CSV into Root Folder)
4) For security I have worked on SQL Injection ( Using ? into query ) and Parameter Injection Attacks ( Used Strong Params )
5) For SQL Injection ( Using ? into query ) Added search for that.
