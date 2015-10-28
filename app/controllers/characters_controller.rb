class CharactersController < ApiController;end
DDC::ControllerBuilder.build :characters, 
  context_params: [:current_user, :params],
  actions: {
    show: {
      context: 'context_builder#user_and_id',
      service: 'character_service#find'
    },
    index: {
      context: 'context_builder#user',
      service: 'character_service#find_all'
    },
    update: {
      context: 'context_builder#character',
      service: 'character_service#update'
    },
    create: {
      context: 'context_builder#character',
      service: 'character_service#create'
    },
    destroy: {
      context: 'context_builder#user_and_id',
      service: 'character_service#destroy'
    }
  }
