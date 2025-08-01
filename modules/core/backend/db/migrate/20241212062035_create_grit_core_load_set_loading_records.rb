class CreateGritCoreLoadSetLoadingRecords < ActiveRecord::Migration[7.2]
  def up
    create_table :grit_core_load_set_loading_records, id: false do |t|
      t.bigint :id, primary_key: true, default: -> { 'nextval(\'grit_seq\'::regclass)' }
      t.string :created_by, limit: 30, null: false, default: "SYSTEM"
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :updated_by, limit: 30
      t.datetime :updated_at
      t.integer :number

      t.references :load_set, foreign_key: { name: "core_load_set_loading_records_core_load_set_id_fkey", to_table: "grit_core_load_sets" }, null: false
    end

    execute "CREATE TRIGGER manage_stamps_grit_core_load_set_loading_records BEFORE INSERT OR UPDATE ON public.grit_core_load_set_loading_records FOR EACH ROW EXECUTE FUNCTION public.manage_stamps();"
  end

  def down
    drop_table :grit_core_load_set_loading_records

    execute "DROP TRIGGER IF EXISTS manage_stamps_grit_core_load_set_loading_records ON public.grit_core_load_set_loading_records;"
  end
end
