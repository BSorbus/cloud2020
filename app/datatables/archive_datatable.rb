class ArchiveDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def_delegators :@view, :link_to, :show_uuid_archive_path

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  include  ActionView::Helpers::NumberHelper

  def view_columns
    @view_columns ||= {
      id:             { source: "Archive.id", cond: :eq, searchable: false, orderable: false },
      name:           { source: "Archive.name", cond: :like, searchable: true, orderable: true },
      note:           { source: "Archive.note", cond: :like, searchable: true, orderable: true },
      folders_count:  { source: "Archive.folders_count", cond: :like, searchable: false, orderable: false },
      files_count:    { source: "Archive.files_count", cond: :like, searchable: false, orderable: false },
      files_size_sum: { source: "Archive.files_size_sum", cond: :like, searchable: false, orderable: false }
      # author:         { source: "User.user_name",  cond: :like, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id:             record.id,
        name:           link_to( record.fullname, show_uuid_archive_path(record.archive_uuid) ),
        note:           record.note_truncate,
        folders_count:  folders_count_badge(record).html_safe,
        files_count:    files_count_badge(record).html_safe,
        files_size_sum: number_to_human_size(files_size_sum(record))
        # author:         link_to( record.author.fullname, user_path(record.author_id) )
      }
    end
  end

  private

    def get_raw_records
      data = Archive.joins(:author, accesses_groups: {users: []})
              .includes(archivizations: [:archivization_type]).references(:author, accesses_groups: [:user])

      options[:eager_filter].present? ? data.for_user_in_archivizations(options[:eager_filter]).all : data.all

    end

    def folders_count_badge(rec)
      count = 11 #rec.components.where(component_file: nil).size
      "<span class='badge alert-info pull-right'> #{count} </span></div>"
    end

    def files_count_badge(rec)
      count = 222 #rec.components.where.not(component_file: nil).size
      "<span class='badge alert-info pull-right'> #{count} </span></div>"
    end

    def files_size_sum(rec)
      # rec.components.where.not(component_file: nil).map {|a| a.component_file.file.size }.sum
      1234567
    end

end
