class Language < ApplicationRecord
  has_many :worker_languages, dependent: :destroy
  has_many :workers, through: :worker_languages

  enum levels: { "Beginner(A1)" => "a1",
                 "Pre-intermediate(A2)" => "a2",
                 "Intermediate(B1)" => "b1",
                 "Upper-Intermediate(B2)" => "b2",
                 "Advanced(C1)" => "c1",
                 "Proficient(C2)" => "c2",
                 "Fluent" => "fluent" },
       _default: :a1
  validates :level, inclusion: { in: Language.levels.keys }

  def name_with_level
    "#{name} - #{level}"
  end

  after_create :create_level_combinations

  def create_level_combinations
    Language.levels.keys.each do |level|
      Language.create(name: name, level: level) unless Language.exists?(name: name, level: level)
    end
  end
end