# encoding: utf-8



module Kernel

  # Enables you to drop into an IRB session from any code.
  #
  # @example
  #   irb_drop(binding)
  def irb_drop(context=nil, *argv)
    require 'irb'
    require 'pp'
    require 'yaml'
    original_argv = ARGV.dup
    ARGV.replace(argv) # IRB is being stupid
    unless defined? ::IRB_SETUP
      IRB.setup(nil)
      Object.const_set(:IRB_SETUP, true)
    end
    irb = IRB::Irb.new(IRB::WorkSpace.new(context))
    IRB.conf[:IRB_RC].call(irb.context) if IRB.conf[:IRB_RC] # loads the irbrc?
    IRB.conf[:MAIN_CONTEXT] = irb.context # why would the main context be set here?
    trap("SIGINT") do irb.signal_handle end
    ARGV.replace(original_argv)
    catch(:IRB_EXIT) do irb.eval_input end
  end
  module_function :irb_drop
end

class Binding

  # @example
  #   binding.irb_drop
  #
  def irb_drop
    Kernel.irb_drop(self)
  end
end
