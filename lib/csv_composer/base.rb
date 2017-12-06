module CsvComposer
  class Base
    abstract

    def compose(items, opts = {})
      content = write(items, opts)
      export(content, opts)
    end


    private

    def header_processor
    end

    def item_processor
    end

    def exporter
    end

    def columns_mapping
      # Create a mapping for each column in the export CSV
    end

    def write(collection, writing_options = {})
      writer = Writer.new
      writer.write(header_processor.new, item_processor.new, collection, columns_mapping, writing_options)
    end

    def export(content, opts = {})
      exporter.new.export(content, opts)
    end

  end
end