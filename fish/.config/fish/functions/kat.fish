function kat -d "Concat yaml files with a --- separator, for kubectl application"
  gawk 'FNR==1 && NR!=1 {print "---"}{print}' $argv
end
