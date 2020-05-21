class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :user_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    @view_columns ||= {
      id:                   { source: "User.id", cond: :eq, searchable: false, orderable: false },
      name:                 { source: "User.user_name", cond: :like, searchable: true, orderable: true },
      email:                { source: "User.email", cond: :like, searchable: true, orderable: true },
      note:                 { source: "User.note", cond: :like, searchable: true, orderable: true },
      current_sign_in_ip:   { source: "User.current_sign_in_ip",  cond: :like, searchable: true, orderable: true },
      current_sign_in_at:   { source: "User.current_sign_in_at",  cond: :like, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id:                   record.id,
        name:                 link_to( record.name, user_path(record.id) ),
        email:                link_to( record.email, user_path(record.id) ),
        note:                 record.note_truncate,
        current_sign_in_ip:   record.current_sign_in_ip,
        current_sign_in_at:   record.current_sign_in_at.present? ? record.current_sign_in_at.strftime("%Y-%m-%d %H:%M:%S") : '' 
      }
    end
  end

  private

  def get_raw_records
    User.distinct
  end


  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
