# Spending-Project

#Prerequesits for macOS

Ruby 2.6.0 -https://www.ruby-lang.org/en/

Ruby pry gem -https://rubygems.org/search?utf8=%E2%9C%93&query=pry

Ruby sinatra gem -https://rubygems.org/search?utf8=%E2%9C%93&query=sinatra

Minitest -https://rubygems.org/search?utf8=%E2%9C%93&query=minitest

Postgres -https://www.postgresql.org/download/

# Installation Instructions for macOS

Ruby 2.6.0: check that you have not installed ruby already by typing "ruby -v" into the terminal

if ruby is not installed follow these instructions: "Ruby versions 2.0 and above are included by default in macOS releases since at least El Capitan (10.11) all the way through Mojave (10.14).

Homebrew is a commonly used package manager on macOS. Installing Ruby using Homebrew is easy:

$ brew install ruby
This should install the latest Ruby version."

Ruby pry gem: type "gem install pry" into your terminal

Ruby sinatra gem: type "gem install sinatra" into your terminal

Ruby minitest gem: type "gem install minitest" into your terminal

Postgres install: Follow the download and install instructions here, https://www.postgresql.org/download/macosx/

# Running the Tests

Make sure to install the minitest gem and ruby beforehand. Once you have these, create a specs folder where the test files can be stored. Name each test file along the lines of: file1_spec.rb if the file being tested is named file1.rb. In this example for file1_spec.rb you would then add the command "require('minitest/autorun')" at the top. The class name should be named "TestClassName < MiniTest::Test" if the file being tested has the class "ClassName". Each method being tested should be named "test_function" if the function is named "function". In each function for the tests to run there needs to be a command "assert", in this projects case I used "assert_equal()".

# Breakdown of each Test

account_spec.rb: 
1. test_first_name, tests that the first_name variable is returned correctly.
2. test_sur_name, tests that the sur_name variable is returned correctly.
3. test_format_name, tests that the first_name and sur_name is returned correctly after being run through the format_name function.
4. test_budget, tests that the budget variable is returned correctly.

tag_spec.rb
1. test_name, tests that the name variable is returned correctly.

merchant_spec.rb
1. test_name, tests that the name variable is returned correctly.

transaction_spec.rb
1. test_amount, tests that the amount variable is returned correctly.

# Acknowledgements

Thank you to ColinF, and KeithD for the support in building this project.
