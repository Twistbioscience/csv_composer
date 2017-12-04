module CsvComposer::ItemProcessors
  class Base
    abstract

    def process(item, columns_mapping, opts) end

  end
end