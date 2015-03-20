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
end
