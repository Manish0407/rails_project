module BookHelper
	class BookDatatable < AjaxDatatablesRails::ActiveRecord
	  extend Forwardable

	  # # either define them one-by-one
	  # def_delegator :@view, :check_box_tag
	  def_delegator :@view, :link_to
	  # def_delegator :@view, :mail_to
	  # def_delegator :@view, :edit_user_path

	  # # or define them in one pass
	  # def_delegators :@view, :check_box_tag, :link_to, :mail_to, :edit_user_path

	  # # ... other methods (view_columns, get_raw_records...)

	  def initialize(params, opts = {})
	    @view = opts[:view_context]
	    super
	  end

	  # now, you'll have these methods available to be used anywhere
	  def data
	    records.map do |record|
	      {
	        id:    check_box_tag('books[]', record.id),
	        name:  record.name,
	        book_author:  record.book_author,
	        qty:   record.qty
	      }
	    end
	  end
	end

	# and in your controller:
	def index
	  respond_to do |format|
	    format.html
	    format.json { render json: BookDatatable.new(params, view_context: view_context) }
	  end
	end
end
