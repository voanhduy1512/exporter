# Exporter
[![Gem Version](https://badge.fury.io/rb/exporter.png)](http://badge.fury.io/rb/exporter)
[![Build Status](https://travis-ci.org/voanhduy1512/exporter.png?branch=master)](https://travis-ci.org/voanhduy1512/exporter)
[![Code Climate](https://codeclimate.com/github/voanhduy1512/exporter.png)](https://codeclimate.com/github/voanhduy1512/exporter)
[![Coverage Status](https://coveralls.io/repos/voanhduy1512/exporter/badge.png)](https://coveralls.io/r/voanhduy1512/exporter)
[![Dependency Status](https://gemnasium.com/voanhduy1512/exporter.png)](https://gemnasium.com/voanhduy1512/exporter)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/voanhduy1512/exporter/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

Help you to export your data to csv or excel in a dead simple way

## Installation

Add this line to your application's Gemfile:

    gem 'exporter'

And then execute:

    $ bundle

## Usage
``` ruby
# Here is the data which you want to export
users = User.all

# export it
Exporter.export(users, :csv).to_file('user.csv')
Exporter.export(users, :excel).to_file('user.xls')
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Run the tests, ensuring they all pass (with travis)
5. Submit a Pull Request using Github




