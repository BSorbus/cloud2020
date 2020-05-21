module ComponentsHelper

  ICON = "paperclip"

  def component_index_legend
    fa_icon(ICON, text: t("component.index.title"))
  end

  def component_edit_legend(data_obj)
    fa_icon(ICON, text: t("component.edit.title") + ": " + data_obj.fullname )
  end

end
