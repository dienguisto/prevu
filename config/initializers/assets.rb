# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( parametres_add.js )
Rails.application.config.assets.precompile += %w( parametres_edit.js )
Rails.application.config.assets.precompile += %w( parametres_delete.js )
Rails.application.config.assets.precompile += %w( impression.css )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.js )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.pie.js )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.tooltip.min.js )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.resize.js )
Rails.application.config.assets.precompile += %w( flot/jquery.flot.time.js )
Rails.application.config.assets.precompile += %w( flot-demo.js )
