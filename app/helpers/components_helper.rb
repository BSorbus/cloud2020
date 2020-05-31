module ComponentsHelper

  ICON = "paperclip"
  ICON_FOLDER = "folder"

  def component_index_legend
    fa_icon(ICON, text: t("component.index.title"))
  end

  def component_edit_legend(data_obj)
    # fa_icon(ICON, text: t("component.edit.title") + ": " + data_obj.fullname )
    data_obj.is_file? ? fa_icon(ICON, text: t("component.edit.title") + ": " + data_obj.name_was ) : fa_icon(ICON_FOLDER, text: t("component.edit.title") + ": " + data_obj.name_was )
  end

  def component_new_legend(data_obj)
    fa_icon(ICON, text: t("component.new.title"))
  end

  def component_new_edit_legend(data_obj)
    data_obj.new_record? ? component_new_legend(data_obj) :  component_edit_legend(data_obj)
  end


end
