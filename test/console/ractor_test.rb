# frozen_string_literal: true

require_relative '../support/console_test_case'

module DEBUGGER__
  
  class RactorDebugger < ConsoleTestCase
    def program_debugger_in_ractor
      <<~RUBY
        1| r = Ractor.new do
        2|   a = 10
        3|   debugger
        4| end
        5| 
        6| r.take
        7| 
        8| b = 20
        9| debugger
      RUBY
    end
    
    def test_debugger_works_in_ractor
      debug_code(program_debugger_in_ractor) do
        type 'c'
        assert_line_num 3
        assert_line_text([
          /.*/,
          /\[1, 9\] in .*/,
          /     1\| r = Ractor\.new do/,
          /     2\|   a = 10/,
          /=>   3\|   debugger/,
          /     4\| end/,
          /     5\| /,
          /     6\| r\.take/,
          /     7\| /,
          /     8\| b = 20/,
          /     9\| debugger/,
          /=>\#0\tblock in <main> at .*/
        ])
        type 'c'
        assert_line_num 9
        assert_line_text([
          /\[4, 9\] in .*/,
          /     4\| end/,
          /     5\| /,
          /     6\| r\.take/,
          /     7\| /,
          /     8\| b = 20/,
          /=>   9\| debugger/,
          /=>\#0\t<main> at .*/
        ])
        type 'c'
      end
    end
  end
end
