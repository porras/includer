# The Includer [![Build Status](https://secure.travis-ci.org/porras/includer.png)](http://travis-ci.org/porras/includer)

The Includer is an easy way to include files into another files, like we are used to do when programming (every language has its own variation of `load`, `require`, `import`, etc.) or in the web (Apache's [SSI](http://httpd.apache.org/docs/2.2/howto/ssi.html), PHP's [`include`](http://php.net/manual/en/function.include.php), Rails' [`render :partial`](http://api.rubyonrails.org/classes/ActionController/Base.html#M000658), etc.) but with any kind of file, under any circunstance.

I use it to split large markdown files, but there are many potential uses (large CSV datasets, or configuration files, for instance). If you do something cool that's worth to be noted in this README, let me know ;-)

## Installation

    sudo gem sources -a http://gemcutter.org # [if you haven't done it already]
    sudo gem install includer
    
## Usage

For a file to include another, you just have to write the following:

    {{path/to/file.ext}}
    
For example, this could be the markdown source for this README.md file (it really isn't ;-) ):

    # The Includer
    
    {{intro.md}}
    {{install.md}}
    {{usage.md}}
    {{copyright.md}}

This can be done recursively: included files can include more files. Try infinite loops at your own risk. I mean, don't try them ;-)

Then, just run The Includer:

    $ includer input.txt output.txt

If you omit the output file, it will write to the standard output.

## Copyright & Licensing

Copyright (c) 2010 Sergio Gil. MIT license, see LICENSE for details.