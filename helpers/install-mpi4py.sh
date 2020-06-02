sitepack=$(python -c "import site; print(site.getsitepackages()[0]);")
userpack=$(python -c "import site; print(site.getusersitepackages());")
cp -r $sitepack/mpi4py $userpack
cp -r $sitepack/mpi4py-* $userpack
