Trestle.resource(:projects) do
  menu do
    item :projects, icon: "fa fa-file-code-o"
  end

  form do |project|
    text_field :name
    text_field :company
    text_field :term
    text_field :URL
    text_area :additions

    collection_select :technology_ids, Technology.all, :id, :name_with_tool, { label: "Technology(ies)" }, { multiple: true }

    sidebar do
      render "sidebar"
    end

  end

  search do |query|
    if query
      Project.where("name ILIKE ? OR company ILIKE ?", "%#{query}%", "%#{query}%")
    else
      Project.all
    end
  end

end
