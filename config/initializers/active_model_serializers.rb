ActiveModel::Serializer.setup do |config|
  config.embed = :ids
  config.embed_in_root = true
end

# blow up when this patch it no longer needed
# see https://github.com/rails-api/active_model_serializers/issues/641#issuecomment-68196151
module RailsApiSerializationPatch
  def _render_with_renderer_json(json, options)
    serializer = build_json_serializer(json, options)

    if serializer
      super(serializer, options)
    else
      super(json, options)
    end
  end
end
ActiveSupport.on_load(:action_controller) do
  include RailsApiSerializationPatch
end
