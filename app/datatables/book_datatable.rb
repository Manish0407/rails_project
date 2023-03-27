class BookDatatable < AjaxDatatablesRails::ActiveRecord

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "record.id" },
      name: { source: "record.name" },
      book_author: { source: "record.book_author" },
      qty: { source: "record.qty" },
    }
  end

  def data
    records.map do |record|
      {
        id:         record.id,
        name: record.name,
        book_author:  record.book_author,
        qty:      record.qty
      }
    end
  end

  def get_raw_records
    # insert query here
    Book.all
  end
end
