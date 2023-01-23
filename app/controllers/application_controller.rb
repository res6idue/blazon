class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    #https://github.com/heartcombo/devise/wiki/How-To:-Change-the-redirect-path-after-destroying-a-session-i.e.-signing-out を参照
    #あとでまだ同じバグが起きるかどうかを検証する
    private
    def after_sign_out_path_for(resource_or_scope)
        root_path
    end

end
