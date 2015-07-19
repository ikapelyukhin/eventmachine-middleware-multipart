module EventMachine
	module Middleware
	end
end

class EventMachine::Middleware::Multipart
	def initialize( boundary = nil )
		@boundary = boundary || "------MultipartFormBoundary" + Random.rand(10000000).to_s
	end

	def is_file?( arg )
		return ( arg.class <= File or ( arg.respond_to?( :__getobj__ ) and arg.__getobj__.class <= File ) )
	end

	def get_file_details( value )
		if ( is_file?( value ) )
			return [ value, {} ]
		elsif ( value.class == Hash and value[:file] and is_file?( value[:file] ) )
			return [ value[:file], value ]
		end
	end

	def has_files?( body )
		return false unless ( body.class == Hash )
		body.each { |field_name, value|
			return true if get_file_details( value )
		}
	end

	def request( client, head, body )
		return [ head, body ] unless has_files?( body )

		head ||= {}
	    head["content-type"] = "multipart/form-data; boundary=#{@boundary}"

	    new_body = []

	    body.each { |field_name, value|
	    	new_body.push %Q{--#{@boundary}}

			if ( temp = get_file_details( value ) )
				file, details = temp
				filename = details[:name] || File.basename( file )

				new_body.push %Q{Content-Disposition: form-data; name="#{field_name}"; filename="#{filename}"}
		        new_body.push %Q{Content-Type: #{details[:content_type]}} if ( details[:content_type] )
		        new_body.push %Q{}

		        file.rewind
		        new_body.push file.read.force_encoding( Encoding::ASCII_8BIT )
			else
				new_body.push %Q{Content-Disposition: form-data; name="#{field_name}"}
		        new_body.push %Q{}
		        new_body.push value.to_s.force_encoding( Encoding::ASCII_8BIT )
			end
		}
	    
	    new_body.push %Q{--#{@boundary}--}

		return [head, new_body.join("\r\n")]
	end
end
