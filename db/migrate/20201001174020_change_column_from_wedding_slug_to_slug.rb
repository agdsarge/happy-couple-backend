class ChangeColumnFromWeddingSlugToSlug < ActiveRecord::Migration[6.0]
  def change
    rename_column :weddings, :wedding_slug, :slug
  end
end
