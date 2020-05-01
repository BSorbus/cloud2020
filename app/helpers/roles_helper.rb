module RolesHelper

  ICON = "user-tag"

  def role_show_legend
    fa_icon(ICON, text: t("role.show.title"))
  end

  def role_index_legend
    fa_icon(ICON, text: t("role.index.title"))
  end

  def role_edit_legend(data_obj)
    fa_icon(ICON, text: t("role.edit.title") + ": " + data_obj.fullname )
  end

  def role_new_legend(data_obj)
    fa_icon(ICON, text: t("role.new.title"))
  end

  def role_info_legend(data_obj)
    role_show_legend + ": " + data_obj.fullname
  end

end
