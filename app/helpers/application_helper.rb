module ApplicationHelper


  def back_to_index_legend
    fa_icon('list', text: t("helpers.links.back_to_index"))
  end

  def help_legend
    fa_icon('info-circle', text: t("helpers.links.help"))
  end

  def last_updated_legend(obj)
    if obj.new_record?
      ""
    else
      t('last_updated') + ": " + obj.updated_at.strftime("%Y-%m-%d %H:%M:%S") + ", " + obj.author.fullname
    end
  end

  # for layouts/messages
  def flash_class_name(name)
    case name
    when 'notice'
      'success'
    when 'alert'
      'error'
    when 'danger'
      'error'
    else 
      name
    end
  end

  # display error layout
  def form_errors_for(object=nil)
    if object.present? && object.errors.any?
      render('layouts/errors', object: object)
    end
  end

  # for nested_attribute
  def link_to_function(name, js, opts={})
    link_to name, '#', opts.merge({onclick: js})
  end

  def link_to_add_fields(name, f, association, opts={})
    # creaate a new object given the form object, and the association name
    new_object = f.object.class.reflect_on_association(association).klass.new

    # call the fields_for function and render the fields_for to a string
    # child index is set to "new_#{association}, which would then later
    # be replaced in in javascript function add_fields
    fields = f.fields_for(association,
        new_object,
        :child_index => "new_#{association}") do |builder|
      # render partial: _task_fields.html.erb
      render(association.to_s.singularize + "_fields", f: builder)
    end

    # call link_to_function to transform to a HTML link
    # clicking this link will then trigger add_fields javascript function
    link_to_function(name,
      h("addNestedFields(this,
        \"#{association}\", \"#{escape_javascript(fields)}\");return false;"),
      class: 'btn btn-sm btn-info pull-right', title: t('tooltip.add_fields_nested'), rel: 'tooltip')
  end

end
