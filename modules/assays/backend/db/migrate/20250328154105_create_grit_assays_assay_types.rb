class CreateGritAssaysAssayTypes < ActiveRecord::Migration[7.2]
  def up
    create_table :grit_assays_assay_types, id: false do |t|
      t.bigint :id, primary_key: true, default: -> { 'nextval(\'grit_seq\'::regclass)' }
      t.string :created_by, limit: 30, null: false, default: "SYSTEM"
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :updated_by, limit: 30
      t.datetime :updated_at
      t.string :name, null: false, index: { unique: true }
      t.text :description
    end

    execute "CREATE TRIGGER manage_stamps_grit_assays_assay_types BEFORE INSERT OR UPDATE ON public.grit_assays_assay_types FOR EACH ROW EXECUTE FUNCTION public.manage_stamps();"
  end

  def down
    drop_table :grit_assays_assay_types

    execute "DROP TRIGGER IF EXISTS manage_stamps_grit_assays_assay_types ON public.grit_assays_assay_types;"
  end
end
