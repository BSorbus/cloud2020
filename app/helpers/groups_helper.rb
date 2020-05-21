module GroupsHelper

  ICON = "user-friends"

  def group_show_legend
    fa_icon(ICON, text: t("group.show.title"))
  end

  def group_index_legend
    fa_icon(ICON, text: t("group.index.title"))
  end

  def group_edit_legend(data_obj)
#    fa_icon(ICON, text: t("group.edit.title") + ": " + data_obj.fullname )
    fa_icon(ICON, text: t("group.edit.title") + ": " + data_obj.fullname_was )
  end

  def group_new_legend(data_obj)
    fa_icon(ICON, text: t("group.new.title"))
  end

  def group_new_edit_legend(data_obj)
    data_obj.new_record? ? group_new_legend(data_obj) :  group_edit_legend(data_obj)
  end

  def group_info_legend(data_obj)
    group_show_legend + ": " + data_obj.fullname
  end

end
