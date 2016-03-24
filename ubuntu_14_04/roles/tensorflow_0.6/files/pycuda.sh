# Install pycuda
wget https://pypi.python.org/packages/source/p/pycuda/pycuda-2016.1.tar.gz -O /tmp/pycuda-2016.1.tar.gz
tar -xvf /tmp/pycuda-2016.1.tar.gz -C /tmp
cd /tmp/pycuda-2016.1
python configure.py --cuda-root=/usr/local/cuda-7.0
make install
