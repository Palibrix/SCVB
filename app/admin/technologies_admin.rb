Trestle.resource(:technologies) do
  menu do
    item :technologies, icon: "fa fa-wrench"
  end

  scopes do
    scope :all, default:true
    scope :frameworks, -> {
      Technology.where(tool: 'Framework')
    }
    scope :languages, -> {
      Technology.where(tool: 'Language')
    }
    scope :platforms, -> {
      Technology.where(tool: 'Platform')
    }
    scope :Databases, -> {
      Technology.where(tool: 'Database')
    }
  end

  form do |technology|
    text_field :name
    text_field :version
    select :tool, Technology.tools.keys.map { |tech| [tech, tech] }

    sidebar do
      render "sidebar"
    end
  end

  search do |query|
    if query
      Technology.where("name ILIKE ?", "%#{query}%")
    else
      Technology.all
    end
  end

end
