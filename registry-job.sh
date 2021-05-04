python2 /registry.py --host http://localhost:5000 --delete --keep-tags "stable" "latest"
supervisorctl restart registry