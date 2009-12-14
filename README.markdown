Dead simple configuration management for simple scripts
=======================================================

Honestly, it doesn't do a lot, but it does let you avoid putting passwords and the like in your scripts.

Install with

    gem install configura

For example, if you were writing a twitter script, you could do:

    config = Configura.new
    httpauth = Twitter::HTTPAuth.new(config['twitter.email'], config['twitter.password'])
    base = Twitter::Base.new(httpauth)

If you're running at the terminal, you'll be prompted to enter missing values - which will then be saved to $HOME/.configura. Otherwise a missing value will cause an exception to be raised.


MIT License
===========

(c) Ben Griffiths 2009

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.