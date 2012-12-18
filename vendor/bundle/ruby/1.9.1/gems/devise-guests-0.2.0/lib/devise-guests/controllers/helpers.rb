module DeviseGuests::Controllers
  module Helpers
    extend ActiveSupport::Concern

    included do
      include ActiveSupport::Callbacks
      (DeviseGuests::Controllers::Helpers.callbacks || []).each do |c|
        define_callbacks *c
      end

    end

    mattr_reader :callbacks

    module ClassMethods

    end

    def self.define_concern_callbacks *args
      @@callbacks ||= []
      @@callbacks << args
    end

    def self.define_helpers(mapping) #:nodoc:
      class_name = mapping.class_name
      mapping = mapping.name

      class_eval <<-METHODS, __FILE__, __LINE__ + 1
        define_concern_callbacks :logging_in_#{mapping}

 
        def guest_#{mapping}
          #{class_name}.find(session[:guest_#{mapping}_id].nil? ? session[:guest_#{mapping}_id] = create_guest_#{mapping}.id : session[:guest_#{mapping}_id])
        end

        def current_or_guest_#{mapping}
          if current_#{mapping}
            if session[:guest_#{mapping}_id]
              run_callbacks :logging_in_#{mapping} do
                guest_#{mapping}.destroy
                session[:guest_#{mapping}_id] = nil
              end
            end
            current_#{mapping}
          else
            guest_#{mapping}
          end
        end

        private
        def create_guest_#{mapping}
          u = #{class_name}.create(:email => "guest_" + guest_#{mapping}_unique_suffix + "@example.com")
          u.save(:validate => false)
          u
        end

        def guest_#{mapping}_unique_suffix
          Devise.friendly_token + "_" + Time.now.to_i.to_s + "_" + unique_#{mapping}_counter.to_s
        end

        def unique_#{mapping}_counter
          @@unique_#{mapping}_counter ||= 0
          @@unique_#{mapping}_counter += 1
        end

      METHODS

      ActiveSupport.on_load(:action_controller) do
        helper_method "guest_#{mapping}", "current_or_guest_#{mapping}"
      end
    end
  end
end
