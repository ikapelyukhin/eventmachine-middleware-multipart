require 'helper'
require 'tempfile'

class TestEventMachineMiddlewareMultipart < Minitest::Test
	def setup
		@tempfile = Tempfile.new('multipart-test')
		@tempfile.write("test")
	end

	def teardown
		@tempfile.unlink
	end

	def test_simple_params
		middleware = EventMachine::Middleware::Multipart.new( "----TestBoundary" )

		expected = [
			%Q{------TestBoundary},
			%Q{Content-Disposition: form-data; name="image"; filename="#{File.basename(@tempfile)}"},
			%Q{},
			%Q{test},
			%Q{------TestBoundary},
			%Q{Content-Disposition: form-data; name="text_field"},
			%Q{},
			%Q{some text},
			%Q{------TestBoundary--},
		].join("\r\n")

		head, body = middleware.request( nil, nil, { :image => @tempfile, :text_field => "some text" } )
		assert_equal expected, body
	end

	def test_extended_params
		middleware = EventMachine::Middleware::Multipart.new( "----TestBoundary" )

		expected = [
			%Q{------TestBoundary},
			%Q{Content-Disposition: form-data; name="testfile"; filename="image.jpg"},
			%Q{Content-Type: image/jpeg},
			%Q{},
			%Q{test},
			%Q{------TestBoundary--},
		].join("\r\n")

		head, body = middleware.request( nil, nil, { :testfile => { :file => @tempfile, :content_type => "image/jpeg", :name => "image.jpg" } } )
		assert_equal expected, body
	end
end
