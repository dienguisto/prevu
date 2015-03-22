module ApplicationHelper
  def link_to_function(name, *args, &block)
    html_options = args.extract_options!.symbolize_keys

    function = block_given? ? update_page(&block) : args[0] || ''
    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'

    content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end


  def titre_page titre
    "<div class='row wrapper border-bottom white-bg page-heading'>
  <div class='col-lg-10'>
    <h2>#{titre}</h2>
  </div>
  <div class='col-lg-2'>

  </div>
</div>".html_safe
  end

  def afficher_etat(etat, yes='oui', no='non')
    if etat
      "<span class='badge badge-primary'>#{yes}</span>"
    else
      "<span class='badge badge-warning'>#{no}</span>"
    end.html_safe
  end

  def afficher_status(status)
    if status == 1
      "<span class='badge badge-default'>En attente</span>"
    elsif status == 2
      "<span class='badge badge-success'>Actif</span>"
    elsif status == 3
      "<span class='badge badge-warning'>Suspendu</span>"
    elsif status == 4
      "<span class='badge badge-danger'>Supprimé</span>"
    end.html_safe
  end

  def set_link(model, action, id)
    id = id.to_s
    if action == 'show'
      "<a href='/"+model+"/"+id+"'><i class='fa fa-check text-navy'></i></a>"
    elsif action == 'edit'
      "<a href='/"+model+"/"+id+"/edit'><i class='fa fa-edit text-navy'></i></a>"
    elsif action == 'remove'
      "<a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/"+model+"/"+id+"><i class='fa fa-delete text-navy'></i></a>"
    end.html_safe
  end
end
