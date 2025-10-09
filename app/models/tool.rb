class Tool < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :category, :price, :condition, presence: true
  validates :photos,
            content_type: %w[image/jpeg image/png],
            size: { less_than: 4.megabytes, message: "taille maximale 4 MB" },
            limit: { min: 1, max: 3 }

  enum category: {
    hand_tools: 0,
    power_tools: 1,
    gardening: 2,
    painting: 3,
    measuring: 4
  }

  enum condition: {
    brand_new: 0,
    good: 1,
    used: 2
  }

  CATEGORY_LABELS = {
    hand_tools: "Outils à main",
    power_tools: "Outils électriques",
    gardening: "Jardinage",
    painting: "Peinture & finition",
    measuring: "Mesure & niveau"
  }

  CONDITION_LABELS = {
    brand_new: "Neuf",
    good: "Bon état",
    used: "Usé"
  }

  def category_label
    CATEGORY_LABELS[category.to_sym]
  end

  def condition_label
    CONDITION_LABELS[condition.to_sym]
  end
end
