class Chef
  class Knife
    class GhostHosts < Knife
      deps do
        require 'chef/knife/bootstrap'
        require 'ghost'
        Chef::Knife::Bootstrap.load_deps
      end
      
      banner "knife ghost hosts (options)"
      
      def run
        all_nodes = []
        q = Chef::Search::Query.new
        query = @name_args[0] || "*:*"
        q.search(:node, query) do |node|
          all_nodes << node
        end
        all_nodes.each do |node|
          if node.has_key?("ec2")
            fqdn = node['ec2']['public_hostname']
            ipaddress = node['ec2']['public_ipv4']
          else
            fqdn = node['fqdn']
            ipaddress = node['ipaddress']
          end


          host = Ghost::Host.new(*[fqdn, ipaddress].compact)
          begin
            Ghost.store.add(host)
            ui.msg "[Adding] #{host.name} -> #{host.ip}"
          rescue Ghost::Host::NotResolvable
            ui.fatal "Unable to resolve IP address for target host #{ip.inspect}."
          end
        end
      end
    end
  end
end