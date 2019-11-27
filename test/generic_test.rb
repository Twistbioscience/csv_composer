require_relative 'test_helper'

module CsvComposer
  class GenericTest < Minitest::Test

    def setup
      @exporter = Generic.new

      @items = [
        { field: 'name1', value: 'value1' },
        { field: 'name2', value: 'value2' }
      ]
    end

    def test_returns_csv_content_in_memory_file_with_original_filename_associated
      filename = 'filename'
      file = @exporter.compose(@items, filename: filename)

      assert(file.string.start_with?('sep=,\n'))
      assert_equal(file.original_filename, filename)
      assert_equal(file.class, StringIO)
    end

  end
end
