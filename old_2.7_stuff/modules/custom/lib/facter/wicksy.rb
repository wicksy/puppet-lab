# wicksy.rb

fact = "This is a test"

Facter.add('wicksy') do
  setcode do
    %x{/usr/bin/uptime | /bin/grep -o '[0-9][0-9]':'[0-9][0-9]':'[0-9][0-9]'}.chomp
  end
end
