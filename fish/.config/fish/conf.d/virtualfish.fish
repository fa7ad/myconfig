set -q VIRTUALFISH_PYTHON
or set VIRTUALFISH_PYTHON python

eval (eval $VIRTUALFISH_PYTHON -m virtualfish $VIRTUALFISH_PLUGINS 2>/dev/null)

if test $status -gt 0
    echo "Please install virtualfish by running `pip install virtualfish`"
    echo "and make sure you've set \$VIRTUALFISH_PYTHON to the correct"
    echo "interpreter"
    echo "See http://virtualfish.readthedocs.io/en/latest/install.html"
end
