module CsvComposer::HeaderProcessors
  class Base
    abstract

    def process(columns_mapping, opts) end

  end
end