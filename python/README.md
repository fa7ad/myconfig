This needs a little bit of a custom setup, the repo just tracks the dir structure but the packages should be updated in `requirements.txt`

setup should go
```bash
cd python
python3 -m venv .pep668
.pep668/bin/python3 -m pip install -r requirements.txt
```

to update requirements.txt
```bash
.pep668/bin/python3 -m pip freeze > requirements.txt
```
