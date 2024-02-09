# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# seeds.rb

# Création de 50 utilisateurs avec des noms et des adresses e-mail générés aléatoirement
# seeds.rb

# Création de 50 utilisateurs avec des noms d'utilisateur, des adresses e-mail, des mots de passe et des noms complets générés aléatoirement
# seeds.rb

# seeds.rb

# Détruire tous les utilisateurs existants
# seeds.rb

# Détruire tous les utilisateurs existants
# seeds.rb

# Détruire tous les utilisateurs existants
# seeds.rb

# Détruire tous les utilisateurs existants
User.destroy_all
Post.destroy_all

# Chemin vers le répertoire contenant les images de profil
profile_pictures_path = "/Users/clementbastien/Pictures/devPictures/face"

# Obtention de la liste des fichiers d'images dans le répertoire
image_files = Dir.glob(File.join(profile_pictures_path, '*.jpg'))

# Création de 50 utilisateurs avec des noms d'utilisateur, des adresses e-mail, des mots de passe et des noms complets générés aléatoirement
50.times do |i|
  username = Faker::Internet.unique.username(specifier: 5..8)
  email = Faker::Internet.unique.email
  full_name = Faker::Name.unique.name
  User.create!(
    username: username,
    email: email,
    password: 'azerty',
    password_confirmation: 'azerty',
    full_name: full_name
  )
end

puts "Created #{User.count} users"

# Mise à jour de chaque utilisateur avec un numéro de téléphone, une biographie et un statut privé
User.all.each_with_index do |user, i|
  user.update!(
    phone_number: Faker::PhoneNumber.phone_number,
    bio: Faker::Lorem.sentence,
    private: [true, false].sample
  )

  # Attacher une image de profil uniquement lors de la mise à jour
  profile_picture_path = image_files[i % image_files.length]
  user.profile_picture.attach(io: File.open(profile_picture_path), filename: "profile_picture_#{user.id}.jpg")

end

puts "Updated users with profile pictures, phone numbers, bios and private status."

# add_posts_to_users.rb (ou tout autre nom de fichier de seed que vous préférez)

# Obtention de la liste des utilisateurs existants
# add_posts_to_users.rb (ou tout autre nom de fichier de seed que vous préférez)

# Obtention de la liste des utilisateurs existants
users = User.all

# Chemin vers le répertoire contenant les images
images_path = "/Users/clementbastien/Pictures/devPictures"

# Obtention de la liste des fichiers d'images dans le répertoire
image_files = Dir.glob(File.join(images_path, '*.jpg')) +
              Dir.glob(File.join(images_path, '*.jpeg')) +
              Dir.glob(File.join(images_path, '*.png')) +
              Dir.glob(File.join(images_path, '*.gif'))

# Pour chaque utilisateur, ajouter entre 1 et 5 posts
users.each do |user|
  rand(1..5).times do
    caption = Faker::Lorem.sentence
    post = user.posts.new(caption: caption)

    # Ajout de 1 ou 2 photos au post
    rand(1..2).times do
      # Sélection d'une image aléatoire excluant les images 1 et 2
      selected_image = nil
      loop do
        selected_image = image_files.sample
        break unless File.basename(selected_image, ".*") == "1" || File.basename(selected_image, ".*") == "2"
      end
      post.images.attach(io: File.open(selected_image), filename: "image_#{post.id}_#{rand(1..100)}.#{File.extname(selected_image).downcase}")
    end

    # Sauvegarde du post seulement s'il a au moins une image attachée
    post.save!
  end
end

puts "Posts added to users successfully."
