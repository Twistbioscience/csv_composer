require 'csv'

module CsvComposer
  class Writer

    def write(header_processor, item_processor, collection, columns_mapping, opts = {})
      CSV.generate do |csv|
        unless header_processor.nil?
          headers = header_processor.process(columns_mapping, opts)
          csv << headers.compact
          opts[:headers] = headers # We are adding the headers in case you need them to process your items
        end
        write_content(csv, item_processor, columns_mapping, collection, opts)
      end
    end

    private

    def write_content(csv, item_processor, columns_mapping, collection, opts)
      collection.each do |item|
        row_components = item_processor.process_value(item, columns_mapping, opts)
        csv << row_components.compact
      end
    end

  end
end