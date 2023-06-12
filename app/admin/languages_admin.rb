Trestle.resource(:languages) do
  menu do
    item :languages, icon: "fa fa-language"
  end
  table do
      column :name
  end

  form do |language|
    text_field :name
    # select :level, Language.levels.keys.map { |level| [level, level] }
    hidden_field :level, value: Language.levels.keys.first
    sidebar do
      render "sidebar"
    end
  end

  controller do
    def update
      instance = admin.find_instance(params)
      name = instance.name

      Language.where(name: name).update_all(params.require(:language).permit(:name).to_h)

      redirect_to admin.path(:index)
    end

    def destroy
      instance = admin.find_instance(params)
      name = instance.name

      Language.where(name: name).destroy_all

      redirect_to admin.path(:index)
    end
  end

  search do |query|
    if query
      Language.where("name ILIKE ?", "%#{query}%").select("DISTINCT ON (name) *")
    else
      Language.select("DISTINCT ON (name) *")
    end
  end
end
