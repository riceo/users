module Users
	module Groups
		def get_gids

			require 'etc'

			gids = []

			Etc.group {|g| gids.push(g.gid) }

			# Stop nogroup affecting the next gid
			gids.delete(65534)

			return gids.sort
		end
	end
end