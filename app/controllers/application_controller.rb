class ApplicationController < ActionController::Base
    before_action :current_user

    def current_user
        if session[:user_id] ||= nil
            @current_user = User.find(session[:user_id])
        end
    end

    def can_rate
        if events = @current_user.events
            events.each do |event|
                if event.time > DateTime.now
                    event.users.each do |user|
                        unless Rating.find(user_id: user.id, event_id: event.id)
                            return true
                        end
                    end
                end
            end
        end
        return false
    end

end
