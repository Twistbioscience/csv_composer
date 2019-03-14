require_relative 'test_helper'

module CsvComposer
  class WriterTest < Minitest::Test

    def setup
      @writer = Writer.new
      lambda = ->(item, key) { item[key] || '' }
      @mapping = [
        { header: 'Name', key: :name, lambda: lambda},
        { header: 'Value', key: :value, lambda: lambda}
      ]
      @items = [
        { name: 'name1', value: 'value1' },
        { name: 'name2', value: 'value2' }
      ]
    end

    def test_calls_injected_colaborators_the_right_amount_of_times
      header_processor = Minitest::Mock.new
      headers = %w(header1 header2)
      header_processor.expect(:process, headers, [@mapping, {}])
      header_processor.expect(:nil?, false)

      item_processor = Minitest::Mock.new
      processed_first_item = [@items[0][:name], @items[0][:value]]
      processed_last_item = [@items[1][:name], @items[1][:value]]

      item_processor.expect(:process_value, processed_first_item, [@items[0], @mapping, { headers: headers }])
      item_processor.expect(:process_value, processed_last_item, [@items[1], @mapping, { headers: headers }])

      content = @writer.write(header_processor, item_processor, @items, @mapping)
      expected_content = "#{headers[0]},#{headers[1]}\n#{@items[0][:name]},#{@items[0][:value]}\n#{@items[1][:name]},#{@items[1][:value]}\n"

      assert_equal(expected_content, content)
      assert_mock(header_processor)
      assert_mock(item_processor)
    end

    def test_generates_the_right_contect_when_header_processor_is_not_present
      item_processor = Minitest::Mock.new
      processed_first_item = [@items[0][:name], @items[0][:value]]
      processed_last_item = [@items[1][:name], @items[1][:value]]

      item_processor.expect(:process_value, processed_first_item, [@items[0], @mapping, { headers: headers }])
      item_processor.expect(:process_value, processed_last_item, [@items[1], @mapping, { headers: headers }])

      content = @writer.write(nil, item_processor, @items, @mapping)
      expected_content = "#{@items[0][:name]},#{@items[0][:value]}\n#{@items[1][:name]},#{@items[1][:value]}\n"

      assert_equal(expected_content, content)
      assert_mock(item_processor)
    end
end
end