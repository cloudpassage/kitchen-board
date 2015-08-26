require 'irb'
require 'awesome_print'
require_relative './halo_api_console/version.rb'
require_relative './halo_api_console/cp_config.rb'
require_relative './halo_api_console/cp_response.rb'
require_relative './halo_api_console/cp_session.rb'
#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

module HaloApiConsole
  class Console
    def start
      ARGV.clear
      IRB.setup nil

      IRB.conf[:PROMPT] = {}
      IRB.conf[:IRB_NAME] = 'halo-api-console'
      IRB.conf[:PROMPT][:MANAITA] = {
          :PROMPT_I => '%N:%03n:%i> ',
          :PROMPT_N => '%N:%03n:%i> ',
          :PROMPT_S => '%N:%03n:%i%l ',
          :PROMPT_C => '%N:%03n:%i* ',
          :RETURN => "# => %s\n"
      }
      IRB.conf[:PROMPT_MODE] = :MANAITA

      IRB.conf[:RC] = false

      require 'irb/completion'
      require 'irb/ext/save-history'
      IRB.conf[:READLINE] = true
      IRB.conf[:SAVE_HISTORY] = 1000
      IRB.conf[:HISTORY_FILE] = '~/..manaita_history'

      context = CpSession
      puts "CloudPassage API Ruby Command Line Interface"
      puts "********************************************"
      puts
      puts " Now you can call: get , post, put, delete "
      puts

      irb = IRB::Irb.new(IRB::WorkSpace.new(context.new))
      IRB.conf[:MAIN_CONTEXT] = irb.context

      trap("SIGINT") do
        IRB.irb.signal_handle
      end

      begin
        catch(:IRB_EXIT) do
          irb.eval_input
        end
      ensure
        IRB.irb_at_exit
      end
    end
  end
end

HaloApiConsole::Console.new.start
