namespace :db do
  # Define a helper to create or update seed records
  task seed: :seed_helper

  # Using the method `seed`, it's possible to have idempotent seeds
  task :seed_helper do
    def seed(model, find_or_create_by, update_with = {})
      record = model.where(find_or_create_by).first_or_initialize

      if record.update_attributes(update_with)
        record
      else
        raise "Couldn't save #{record.class} (#{record.errors.full_messages.join(', ')})"
      end
    end
  end
end
