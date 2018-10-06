function __fish_prog_needs_command
	set -l cmd (commandline -opc)
	if test (count $cmd) -eq 1
		return 0
	end
	return 1
end
