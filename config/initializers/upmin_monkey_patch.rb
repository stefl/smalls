module Upmin::DistinctQueryHackery
  def results
    if klass.model_class.columns.find { |c| c.type == :json }
      key = klass.model_class.table_name + ".id"
      super.distinct(false).group(key).order(key)
    else
      super
    end
  end
end

Upmin::ActiveRecord::Query.prepend Upmin::DistinctQueryHackery