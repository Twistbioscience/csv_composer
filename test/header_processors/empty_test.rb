require_relative '../test_helper'

module CsvComposer::HeaderProcessors
  class EmptyTest < Minitest::Test

    def test_return_empty_headers_on_process
      headers = Empty.new.process([], {})
      assert_nil(headers)
    end

  end
end