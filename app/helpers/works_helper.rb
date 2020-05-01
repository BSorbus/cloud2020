module WorksHelper

  ICON = "history"

  def work_index_legend
    fa_icon(ICON, text: t("work.index.title"))
  end

end