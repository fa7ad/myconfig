function __set_glab_host --on-variable PWD --on-event fish_prompt --description 'Set GITLAB_HOST based on the current repo'
  git rev-parse --is-inside-work-tree > /dev/null 2>&1; or return
  set -l url (git remote get-url origin; or echo '')
  if test -z "$url"; return; end

  set -l h ''
  if string match -q -- https $url
    set h (string split / $url)[3]
  else
    set h (string match -r '.*@([^:/]+)' $url)[2]
  end

  test "$GITLAB_HOST" = "$h"; and return
  set -gx GITLAB_HOST $h
end
