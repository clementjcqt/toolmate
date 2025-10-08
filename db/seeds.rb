# db/seeds.rb

require "open-uri"

puts "Cleaning database..."
Tool.destroy_all
User.destroy_all

puts "Creating user..."
user = User.create!(
  email: "clement@clement.fr",
  name: "Clément",
  password: "password123",
  bio: "Hello world",
  street: "41 Rue petit parc",
  city: "Bordeaux",
  post_code: 33_200
)

def image_path(filename)
  Rails.root.join("app/assets/images/tools/#{filename}")
end

puts "Creating tools..."
tools = [
  { name: "Marteau",
    category: :hand_tools,
    price: 5,
    condition: :brand_new,
    is_available: true,
    description: "Un marteau robuste pour vos travaux de bricolage.",},
  { name: "Tournevis électrique",
    category: :power_tools,
    price: 10,
    condition: :good,
    is_available: true,
    description: "Idéal pour monter des meubles rapidement.",},
  { name: "Perceuse",
    category: :power_tools,
    price: 15,
    condition: :used,
    is_available: false,
    description: "Perceuse à percussion, fonctionne encore très bien."},
  { name: "Tondeuse",
    category: :gardening,
    price: 20,
    condition: :good,
    is_available: true,
    description: "Tondeuse thermique adaptée aux petits jardins."},
  { name: "Sécateur",
    category: :gardening,
    price: 7,
    condition: :brand_new,
    is_available: true,
    description: "Pour couper branches et arbustes."},
  { name: "Rouleau à peinture",
    category: :painting,
    price: 3,
    condition: :used,
    is_available: true,
    description: "Rouleau avec manche télescopique."},
  { name: "Pinceau large",
    category: :painting,
    price: 2,
    condition: :good,
    is_available: true,
    description: "Pour des finitions propres."},
  { name: "Niveau laser",
    category: :measuring,
    price: 12,
    condition: :brand_new,
    is_available: true,
    description: "Laser précis pour aligner vos travaux."},
  { name: "Mètre ruban",
    category: :measuring,
    price: 1,
    condition: :used,
    is_available: true,
    description: "5 mètres, pratique pour tout type de mesures."},
  { name: "Scie manuelle",
    category: :hand_tools,
    price: 6,
    condition: :good,
    is_available: true,
    description: "Scie idéale pour couper le bois."}
]

puts "🔧 Creating tools..."

def image_path_for(name)
  base = name.to_s.parameterize
  dir  = Rails.root.join("app/assets/images/tools")
  # Try common extensions
  %w[png jpg jpeg webp].each do |ext|
    path = dir.join("#{base}.#{ext}")
    return path if File.exist?(path)
  end
  nil
end

tools.each do |attrs|
  tool = Tool.new(attrs.merge(user: user))  # not saved yet

  if (path = image_path_for(attrs[:name]))
    tool.photos.attach(
      io: File.open(path, "rb"),
      filename: File.basename(path),
      content_type: Marcel::MimeType.for(path)
    )
  else
    # fallback to a placeholder so validation passes
    placeholder = Rails.root.join("app/assets/images/tools/placeholder.png")
    tool.photos.attach(
      io: File.open(placeholder, "rb"),
      filename: "placeholder.png",
      content_type: Marcel::MimeType.for(placeholder)
    )
    puts "⚠️ No image found for #{attrs[:name]} — attached placeholder"
  end

  tool.save!  # now validations run with at least 1 photo attached
  puts "✅ Created #{tool.name} with 1 photo"
end
