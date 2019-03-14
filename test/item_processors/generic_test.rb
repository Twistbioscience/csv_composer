require_relative '../test_helper'

module CsvComposer::ItemProcessors
  class GenericTest < Minitest::Test

    def test_calls_lambda_for_every_mapping_field_with_key_parameter_for_an_item
      related_lambda = Minitest::Mock.new
      item = { name: 'name1', value: 'value1'}
      mapping = [
        { header: 'Id', key: :id, lambda: related_lambda },
        { header: 'Value', key: :value, lambda: related_lambda }
      ]
      related_lambda.expect(:call, item[:name], [item, mapping[0][:key]])
      related_lambda.expect(:call, item[:value], [item, mapping[1][:key]])

      processed_value = Generic.new.process_value(item, mapping, {})
      assert_equal([item[:name], item[:value]], processed_value)
      assert_mock(related_lambda)
    end

  end
end