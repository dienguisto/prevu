module ApplicationHelper
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
