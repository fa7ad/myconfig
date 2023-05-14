#!/usr/bin/env fish

for dir in */
    stow $dir
end
