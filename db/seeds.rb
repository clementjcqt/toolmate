# db/seeds.rb

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

puts "Creating tools..."
tools = [
  { name: "Marteau",
    category: :hand_tools,
    price: 5,
    condition: :brand_new,
    is_available: true,
    description: "Un marteau robuste pour vos travaux de bricolage." },
  { name: "Tournevis électrique",
    category: :power_tools,
    price: 10,
    condition: :good,
    is_available: true,
    description: "Idéal pour monter des meubles rapidement." },
  { name: "Perceuse",
    category: :power_tools,
    price: 15,
    condition: :used,
    is_available: false,
    description: "Perceuse à percussion, fonctionne encore très bien." },
  { name: "Tondeuse",
    category: :gardening,
    price: 20,
    condition: :good,
    is_available: true,
    description: "Tondeuse thermique adaptée aux petits jardins." },
  { name: "Sécateur",
    category: :gardening,
    price: 7,
    condition: :brand_new,
    is_available: true,
    description: "Pour couper branches et arbustes." },
  { name: "Rouleau à peinture",
    category: :painting,
    price: 3,
    condition: :used,
    is_available: true,
    description: "Rouleau avec manche télescopique." },
  { name: "Pinceau large",
    category: :painting,
    price: 2,
    condition: :good,
    is_available: true,
    description: "Pour des finitions propres." },
  { name: "Niveau laser",
    category: :measuring,
    price: 12,
    condition: :brand_new,
    is_available: true,
    description: "Laser précis pour aligner vos travaux." },
  { name: "Mètre ruban",
    category: :measuring,
    price: 1,
    condition: :used,
    is_available: true,
    description: "5 mètres, pratique pour tout type de mesures." },
  { name: "Scie manuelle",
    category: :hand_tools,
    price: 6,
    condition: :good,
    is_available: true,
    description: "Scie idéale pour couper le bois." }
]

tools.each do |tool_attrs|
  Tool.create!(tool_attrs.merge(user: user))
end

puts "Created #{Tool.count} tools for #{user.name}"
