# Todo for everyone

Simple GTD app for task tracking.

Supports all Rubies and many stacks (passenger, unicorn, trinidad/jruby).

# To run individual tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb

# To run specific tests: (for example)

bundle exec ruby -Itest test/functional/lists_controller_test.rb --name test_should_create_list

# Delayed Job branch

This branch includes delayed_job - the Rails gem and the EY Cloud recipes. You have to run `ey recipes upload` and `ey recipes apply` on the root directory on your local machine. You can read more details about custom chef recipes at https://support.cloud.engineyard.com/entries/21009867-custom-chef-recipes
