# Nodeattr

Ruby implementation of nodeattr.

The goal is to replicate functionality of nodeattr as defined by the Genders library developed by [LLNL](https://computing.llnl.gov/linux/genders.html).

Current implementation is very limited in that only simple gender query works. This will be expanded upon to provide union, intersection, and exclusion of genders. Values are also not yet supported, but are planned for a future update.

Included are the nodeattr class and the nodeattr command line tool.

## Installation

Add this line to your application's Gemfile:

    gem 'nodeattr'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nodeattr

## Class Usage

    require 'nodeattr'
    
    n = NodeAttr.new
    
    if nodes = n.query(@gender)
      puts nodes.join(@sep)
    end


## Command Line Usage

    Usage: nodeattr [options] query
    
    -f genders                       genders file
    -n                               space  separated  list
    -s                               newline  separated  list
    -c                               comma separated list

    nodeattr -f example/genders -s unix
    web-01 web-02 web-03 web-04 mail-01 mail-02 mail-03 mail-04 mail-05 mail-06 mail-07 mail-08 mail-09 mail-10

    nodeattr -f example/genders web
    web-01
    web-02
    web-03
    web-04
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
