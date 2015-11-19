class WorldViewsController < ApiController;end
DDC::ControllerBuilder.build :world_views, 
  context_params: [:current_user, :params],
  actions: {
    index: {
      context: 'context_builder#user_and_character',
      service: 'world_service#view_for_character'
    },
  }
