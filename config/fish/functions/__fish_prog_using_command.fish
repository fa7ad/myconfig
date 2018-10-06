function __fish_prog_using_command
	set -l cmd (commandline -opc)
	if test (count $cmd) -gt 1
		if test $argv[1] = $cmd[2]
			return 0
		end
	end
	return 1
end
