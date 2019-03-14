module CsvComposer::HeaderProcessors
  class EmptyHeader < Base

    def process(columns_mapping, opts)
    	nil
    end

  end
end