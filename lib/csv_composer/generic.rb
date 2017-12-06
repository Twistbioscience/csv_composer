module CsvComposer
  class Generic < Base
    protected

    def header_processor
      HeaderProcessors::Generic
    end

    def item_processor
      ItemProcessors::Generic
    end

    def generic_lambda
      ->(item, key) { item[key] || '' }
    end

    def columns_mapping
      [
        { id: 'Id', key: :id, lambda: generic_lambda },
        { id: 'Value', key: :value, lambda: generic_lambda }
      ]
    end

    def exporter
      FileExporters::StringIo
    end

  end
end