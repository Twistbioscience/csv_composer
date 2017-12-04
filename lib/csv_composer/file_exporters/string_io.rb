module CsvComposer::FileExporters
  class StringIo < Base

    def export(content, opts = { })
      file = StringIO.open(content)
      file.class.class_eval { attr_accessor :original_filename }
      file.original_filename = opts[:filename]
      file
    end

  end
end