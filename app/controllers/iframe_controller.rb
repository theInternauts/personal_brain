class IFrameController < Clearance::SessionsController
	def new
		response.headers.except! 'X-Frame-Options'
		puts "----------- x - allow_iframe -------------------"
		super(request, response)
	end
end