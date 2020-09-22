class ApplicationController < ActionController::API

    def encode_token(payload) # payload is a user or userID. see: auth_controller#login
        JWT.encode(payload, ENV['SECRET_KEY'], 'HS256')
    end

    def decode_token(token)
       JWT.decode(token, ENV['SECRET_KEY'], true, {algorithm: 'HS256'})[0]
    end

    def authorize_request
        #take in header
        #decode token with userid
        #if valid return currentUser

        auth = request.headers['Authorization']
        
        if auth
            auth = auth.split(' ').last
        end 
        
        begin
            
            @decoded = decode_token(auth) # @decoded is a UserId
            @current_user = User.find(@decoded['user_id'])
        rescue ActiveRecord::RecordNotFound => e
            #from the jwt documentation.
            render json: {errors: e.message}, status: :unauthorized
        rescue JWT::DecodeError => e
            #from the jwt documentation
            render json: {errors: e.message}, status: :unauthorized
        end
    

    end

end
