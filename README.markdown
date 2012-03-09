README
======


Summary
-------
IRB sessions anywhere!


Installation
------------
`gem install irb_drop`


Usage
-----
Anywhere in your code, you can just place

    binding.irb_drop

That will drop you into an irb session right there.

Full example:

    require 'irb_drop'
    x = 1
    puts "before drop, x is now: #{x}"
    binding.irb_drop # <-- irb shell starts here, assign something to x, exit from irb
                     #     with `exit`
    puts "after drop, x is now: #{x}"


Description
-----------
Enables you to drop into an IRB session from any code.
