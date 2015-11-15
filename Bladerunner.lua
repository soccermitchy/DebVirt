function target.config()
	local name = "Generating live build configuration..."
	local config_args = {
		"--apt apt",
		"--debian-installer-gui false",
		"--distribution jessie",
		"--iso-application DebVirt",
		"--iso-preparer 'Mitchell Monahan'",
		"--iso-publisher 'Mitchell Monahan'",
		"--mode debian",
	}
	print(name)
	local exitCode,stdout,stderr=blade.exec("lb config "..table.concat(config_args," "))
	blade.printStatus(name,exitCode)
end
blade.help(target.config,"Generate configuration for live-build")

function target.bootstrap(use)
	local name = "Bootstrapping chroot..."
	print(name)
	local exitCode,stdout,stderr=blade.exec("lb bootstrap")
	blade.printStatus(name,exitCode)
	if exitCode==1 and stderr:find('need root privileges') then
		print('This is a known issue with live-build, the tool used here to generate the distro. Fakeroot doesn\'t work, sadly. Tell me if you have any success in it and I\'ll add it to this script.')
	end
end
blade.help(target.bootstrap,"Bootstrap the chroot with a debian install.")

function target.chroot()
	local name = "Customizing chroot..."
	print(name)
	local exitCode,stdout,stderr=blade.exec("lb chroot")
	blade.printStatus(name,exitCode)
	if exitCode==1 and stderr:find('need root privileges') then
		print('This is a known issue with live-build, the tool used here to generate the distro. Fakeroot doesn\'t work, sadly. Tell me if you have any success in it and I\'ll add it to this script.')
	end
end
blade.help(target.chroot,"Customize the chroot with the packages used in the distro.")

function target.binary()
	local name = "Generating binary..."
	print(name)
	local exitCode,stdout,stderr=blade.exec("lb binary")
	blade.printStatus(name,exitCode)
        if exitCode==1 and stderr:find('need root privileges') then
		print('This is a known issue with live-build, the tool used here to generate the distro. Fakeroot doesn\'t work, sadly. Tell me if you have any success in it and I\'ll add it to this script.')
	end

end
blade.help(target.binary,"Generate the iso file for the distro")
