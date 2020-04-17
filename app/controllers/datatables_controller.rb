class DatatablesController < ApplicationController

PL =  {
        "sProcessing":   "<span class='fa fa-circle-notch fa-spin fa-3x' style='color:lightgrey;'></span>",
        "sLengthMenu":   "<span class='fa fa-arrows-alt-v'></span> _MENU_",
        "sZeroRecords":  "Nie znaleziono pasujących pozycji",
        "sEmptyTable":   "Brak danych",
        "sInfo":         "Pozycje od _START_ ... _END_ z _TOTAL_ łącznie",
        "sInfoEmpty":    "Pozycji 0 z 0 dostępnych",
        "sInfoFiltered": "(filtrowanie spośród _MAX_ dostępnych pozycji)",
        "sInfoPostFix":  "",
        "sInfoThousands":  " ",
        "sLoadingRecords": "Wczytywanie...",
        "sSearch":       "<span class='fa fa-search'></span>",
        "oPaginate": {
          "sFirst":     "<<",
          "sPrevious":  "<",
          "sNext":      ">",
          "sLast":      ">>"
        },
        "oAria": {
          "sSortAscending":  ": aktywuj, by posortować kolumnę rosnąco",
          "sSortDescending": ": aktywuj, by posortować kolumnę malejąco"
        },
        "select": {
            "rows": {
                "_": "<span class='text-primary'>%d wierszy zaznaczonych</span>",
                "0": "<span class='text-primary'>Kliknij w wiersz aby go zaznaczyć</span>",
                "1": "<span class='text-primary'>1 wiersz zaznaczony</span>",
                "2": "<span class='text-primary'>2 wiersze zaznaczone</span>",
                "3": "<span class='text-primary'>3 wiersze zaznaczone</span>",
                "4": "<span class='text-primary'>4 wiersze zaznaczone</span>"
            }
        }
      }

EN =  {
        "sProcessing":     "<span class='fa fa-circle-notch fa-spin fa-3x' style='color:lightgrey;'></span>",
        "sLengthMenu":     "<span class='fa fa-arrows-alt-v'></span> _MENU_",
        "sZeroRecords":    "No matching records found",
        "sEmptyTable":     "No data available in table",
        "sInfo":           "Showing _START_ ... _END_ of _TOTAL_ entries",
        "sInfoEmpty":      "Showing 0 to 0 of 0 entries",
        "sInfoFiltered":   "(filtered from _MAX_ total entries)",
        "sInfoPostFix":    "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Loading...",
        "sSearch":         "<span class='fa fa-search'></span>",
        "oPaginate": {
          "sFirst":     "<<",
          "sPrevious":  "<",
          "sNext":      ">",
          "sLast":      ">>"
        },
        "oAria": {
          "sSortAscending":  ": activate to sort column ascending",
          "sSortDescending": ": activate to sort column descending"
        },
        "select": {
            "rows": {
                "_": "<span class='text-primary'>%d selected rows</span>",
                "0": "<span class='text-primary'>Click for select</span>",
                "1": "<span class='text-primary'>1 selected row</span>"
            }
        }
      }



  def lang
    respond_to do |format|
      format.json { render json: langue(params[:locale]) }
    end
  end

  private
    def langue (loc)
      case loc
      when "pl"
        PL
      when "en"
        EN
      end
    end

end
