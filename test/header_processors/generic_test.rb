require_relative '../test_helper'

module CsvComposer::HeaderProcessors
  class GenericCsvHeaderProcessorTest < Minitest::Test

    def setup
      @mapping = [
        { header: 'Id', key: :id },
        { header: 'Value', key: :sequence }
      ]
    end

    def test_makes_header_collection_from_headears_key
      headers = Generic.new.process(@mapping, {})
      expected_headers = @mapping.map{ |e| e[:header]}
      assert_equal(expected_headers, headers)
    end

  end
end