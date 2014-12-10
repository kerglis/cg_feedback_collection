desc "API Routes"
task api_routes: :environment do
  puts "API routes"
  API.routes.each do |api|
    method = api.route_method.ljust(10)
    path = api.route_path
    puts "     #{method} #{path}"
  end
  puts
end
