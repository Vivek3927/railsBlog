module Visible
	extend ActiveSupport::Concern

	VALID_STATUSES = ['public', 'private', 'archived']
	
	included do 
	 	validate :status,  if: :VALID_STATUSES		
	end
	
	class_methods do
		def public_count
			where(status: 'public').count
		end
	end
	
	def archived?
			status == 'archived'
	end
end
