Hoshi-mi
========================================

[![Build Status](https://secure.travis-ci.org/codefirst/hoshi-mi.png?branch=master)](http://travis-ci.org/codefirst/hoshi-mi)

Overview
------------------------------
Hoshi-mi is a portable graph / visualization tool.

Requirements
------------------------------

 * Ruby 1.8.7 or 1.9.3
 * Bundler

Setup
------------------------------

    $ cd path/to/hoshi-mi
    $ bundle install --path .bundle
    $ bundle exec rake db:migrate
    $ bundle exec rails s

Deploy for JRuby
------------------------------

    $ bundle exec rake assets:precomile
    $ bundle exec warble

and deploy `hoshi-mi.war` to your prefer application server(e.g. Tomcat).

Test
------------------------------

    $ bundle exec rspec

or

    $ bundle exec rake spec

if you are a hoshi-mi developer, run a following command on background,

    $ bundle exec guard start

then, enjoy developing!!

Author
------------------------------

 * @mallowlabs
 * @suer
 * @mzp

License
------------------------------
The MIT License (MIT)
Copyright (c) 2012 codefirst.org

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

