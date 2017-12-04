module CsvComposer::ItemProcessors
  class Generic < Base

    def process_value(item, columns_mapping, opts)
      columns_mapping.map do |column|
        column[:lambda].call(item, column[:key])
      end
    end

  end
end