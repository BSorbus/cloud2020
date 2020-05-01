module UsersHelper

  ICON = "user"

  def user_show_legend
    fa_icon(ICON, text: t("user.show.title"))
  end

  def user_index_legend
    fa_icon(ICON, text: t("user.index.title"))
  end

  def user_edit_legend(data_obj)
    fa_icon(ICON, text: t("user.edit.title") + ": " + data_obj.fullname )
  end

  def user_new_legend(data_obj)
    fa_icon(ICON, text: t("user.new.title"))
  end

  def user_info_legend(data_obj)
    user_show_legend + ": " + data_obj.fullname
  end

end