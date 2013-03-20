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

		def group_exists(group_name)

			require 'etc'

			begin
				Etc.getgrnam(group_name)
				return true
			rescue
				return false
			end
		end

	end
end