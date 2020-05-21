module ArchivesHelper

  ICON = "archive"

  def archive_show_legend
    fa_icon(ICON, text: t("archive.show.title"))
  end

  def archive_index_legend
    fa_icon(ICON, text: t("archive.index.title"))
  end

  def archive_edit_legend(data_obj)
    fa_icon(ICON, text: t("archive.edit.title") + ": " + data_obj.fullname )
  end

  def archive_new_legend(data_obj)
    fa_icon(ICON, text: t("archive.new.title"))
  end

  def archive_info_legend(data_obj)
    archive_show_legend + ": " + data_obj.fullname
  end

end
