require 'irb'

module IRB # :nodoc:
  def self.start_session(binding)
    ARGV << "--noinspect" unless ARGV.include?("--inspect")
    unless @__initialized
      args = ARGV
      ARGV.replace(ARGV.dup)
      IRB.setup(nil)
      ARGV.replace(args)
      @__initialized = true
    end

    workspace = WorkSpace.new(binding)
    @CONF[:IRB_RC].call(irb.context) if @CONF[:IRB_RC]
    @CONF[:AUTO_INDENT] = true
    @CONF[:PROMPT_MODE] = :SIMPLE
    irb = Irb.new(workspace)

    @CONF[:MAIN_CONTEXT] = irb.context

    catch(:IRB_EXIT) do
      irb.eval_input
    end
  end
end
