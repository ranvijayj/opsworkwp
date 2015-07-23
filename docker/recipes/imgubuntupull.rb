docker_service 'default' do
  action [:create, :start]
end

docker_image 'ubuntu:latest' do
  action :pull
end

docker_container 'test server' do
  image 'ubuntu:latest'
  port '80:80'
  command "nc -ll -p 1234 -e /bin/cat"
  detach true
  init_type false
end
