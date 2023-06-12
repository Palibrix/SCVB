Trestle.resource(:workers) do
  menu do
    item :workers, icon: "fa fa-user-circle"
  end

  form do |worker|
    text_field :name
    text_field :surname
    text_field :occupation
    phone_field :phone
    email_field :email
    text_field :address
    text_area :about

    collection_select :quality_ids, Quality.all, :id, :name, { label: "Quality(ies)" }, { multiple: true }
    collection_select :language_ids, Language.all, :id, :name_with_level, { label: "Language(s)" }, { multiple: true }
    collection_select :education_ids, Education.all, :id, :name_with_term, { label: "Education(s)" }, { multiple: true }
    collection_select :technology_ids, Technology.all, :id, :name_with_tool, { label: "Technology(ies)" }, { multiple: true }
    collection_select :project_ids, Project.all, :id, :name_with_company, { label: "Project(s)" }, { multiple: true }

    sidebar do
      render "sidebar"
    end
  end

  controller do

    def generate_pdf
      self.instance = admin.find_instance(params)
      flash[:message] = "PDF successfully generated"

      @job_id = PdfGeneratorJob.perform_async(instance.name, instance.surname, instance.occupation,
                                              instance.qualities.to_json, instance.phone, instance.email, instance.address,
                                              instance.about, instance.languages.to_json, instance.educations.to_json,
                                              instance.technologies.to_json, instance.projects.to_json)

      respond_to do |format|
        format.js
      end
    end

    def check_status
      status = Sidekiq::Status::status(params[:job_id])
      if status == :complete
        send_file 'storage/cv.pdf', type: 'application/pdf'
      else
        head :no_content
      end
    end
  end

  routes do
    post :generate_pdf, on: :member
    get :check_status, on: :collection
  end

  search do |query|
    if query
      terms = query.split
      if terms.length > 1
        Worker.where("(name ILIKE ? AND surname ILIKE ?) OR (surname ILIKE ? AND name ILIKE ?)",
                     "%#{terms[0]}%", "%#{terms[1]}%", "%#{terms[0]}%", "%#{terms[1]}%")
      else
        Worker.where("name ILIKE ? OR surname ILIKE ? OR email ILIKE ? OR phone ILIKE ?",
                     "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
      end
    else
      Worker.all
    end
  end
end
