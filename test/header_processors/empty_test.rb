require_relative '../test_helper'

module CsvComposer::HeaderProcessors
  class EmptyTest < Minitest::Test
    def setup
      @mapping = [
        { header: 'Id', key: :id },
        { header: 'Value', key: :sequence }
      ]
    end

    def test_return_empty_headers_on_process
      headers = EmptyHeader.new.process(@mapping, {})
      assert_nil(headers)
    end

  end
end