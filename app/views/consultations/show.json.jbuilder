json.extract! @consultation, :id, :description, :montant,
              :type_acte_medical_id, :adherent_id,
              :formation_sanitaire_id, :created_at, :updated_at
json.formation_sanitaire @consultation.formation_sanitaire.title
json.type_acte_medical @consultation.type_acte_medical.nom
json.categorie_acte_medical @consultation.type_acte_medical.categorie_acte_medical.nom
json.date @consultation.created_at.strftime("%A, %d %b %Y %l:%M %p")