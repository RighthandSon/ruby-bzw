# ruby-bzw

A bzw object creation script from [tainn](https://github.com/tainn/bzw) converted to ruby.

## Usage

Put your script in the same directory as ruby-bzw.rb and add:
```ruby
require_relative 'ruby-bzw'
```

## Examples

```ruby
require_relative 'ruby-bzw'

#initialize
Bzw.initialize("my-world")

#create object
Bzw.create("box", name: "box1",
            position: [10, 10, 10],
            size: [20, 20, 10],
            rotation: 45)

#define a group
Bzw.define("blox")
Bzw.create(...)
Bzw.define("blox", true)

#include a path to other world
Bzw.include("/path/to/bzw")

#indent code with a spaces " "
Bzw.indent(4)

#insert an already existing file into the current one.
#as an alternative to include
Bzw.insert("/path/to/insert/bzw")

#add comments into your bzw file
Bzw.comment("This is a comment")

#add number of empty lines
Bzw.emptyline(2)

#export your code to a filename given at initialize
#used at the end of your script to save your world
Bzw.writeOut()

#dump current content into output
Bzw.stdOut()
```

## To Do

Something to consider is turning this into a ruby gem...
