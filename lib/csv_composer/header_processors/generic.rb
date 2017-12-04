module CsvComposer::HeaderProcessors
  class Generic < Base

    def process(columns_mapping, opts)
      columns_mapping.map do |c|
        c[:header]
      end
    end

  end
end