Trestle.resource(:educations) do
  menu do
    item :educations, icon: "fa fa-graduation-cap"
  end

  form do |education|
    text_field :name
    text_field :specialization
    text_field :term

    sidebar do
      render "sidebar"
    end
  end

  search do |query|
    if query
      Education.where("name ILIKE ?", "%#{query}%")
    else
      Education.all
    end
  end
end
