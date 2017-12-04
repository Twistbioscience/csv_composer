module CsvComposer::FileExporters
  class Base
    abstract

    def export(content, opts = {}) end

  end
end