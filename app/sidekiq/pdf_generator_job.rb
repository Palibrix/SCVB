class PdfGeneratorJob
  include Sidekiq::Job
  include Sidekiq::Status::Worker

  def perform(name, surname, occupation, qualities, phone, email, address, about,
              languages, educations, technologies, projects)
    html = File.read('storage/cv_template.html.erb')
    route = 'storage/cv.pdf'

    template = ERB.new(html)

    rendered_text = template.result(binding)

    kit = PDFKit.new(rendered_text, :enable_local_file_access => true)
    kit.to_file(route)
  end
end
