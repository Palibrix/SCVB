Trestle.resource(:qualities) do
  menu do
    item :qualities, icon: "fa fa-trophy"
  end

  table do
    column :id
    column :name
  end

  form do |quality|
    text_field :name

    sidebar do
      render "sidebar"
    end
  end

  search do |query|
    if query
      Quality.where("name ILIKE ?", "%#{query}%")
    else
      Quality.all
    end
  end
end
